class JobController < ApplicationController

  skip_before_filter :authenticate_job!, :only => [:index]

  autocomplete :category, :name, :full => true

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
    # update_new_job job job_params
  end

  def update
    job = Job.find(params[:id])
    update_new_job job, get_update_params(job)
  end

  def show
    @job = Job.find(params[:id])
  end

  def my_jobs
    if current_user.is_admin?
      flash[:notice] = "You are the ADMIN. Please remember: With great power comes great responsibility :)"
      @jobs = Job.all
    elsif current_user.is_employer?
      @jobs = Job.where(:owner_id => current_user.id)
    elsif current_user.is_jobseeker?
      @jobs = current_user.jobs
    end
  end


  def suggested_jobs
    desc = current_user.jobs.first.description
    key = "%#{desc}%"
    @jobs = Job.all.where("description LIKE ?", key).not_applied_to(current_user.id)
  end

  def create
    job = Job.new
    update_new_job job, get_update_params(job)
  end

  def get_update_params job
    update_params = job_params
    category_id = job[:category_id]
    if job.title.nil?
      category_id = Category.find_or_create_by(:name => job_params[:category]).id
      # Delete category name, just storing id (in job object)
      update_params.delete(:category)
    end

    update_params[:owner_id] = current_user.id
    update_params[:category_id] = category_id
    update_params[:deadline] = format_date job_params[:deadline]
    update_params
  end

  def apply
    if current_user.is_jobseeker?
      job = Job.find(params[:job_id])
      current_user.jobs << job
      JobMailer.application_conformation(job).deliver
      redirect_to job_index_path
    else
      flash[:notice] = "You are not allowed to apply for the job. Please create a new jobseeker account."
      redirect_to root_path
    end
  end

  # Delete job, only employers can do this
  def destroy
    if current_user.is_employer?
      @job = Job.find(params[:id])
      @job.destroy
      flash[:success] = "Job deleted"
      redirect_to job_index_path
    else
      flash[:notice] = "You are not allowed to delete jobs. Only employers can do that!"
      redirect_to job_index_path
    end
  end

  private

  # Checks format of date, returns nil if bad format.
  def format_date date
    begin
      DateTime.parse(job_params[:deadline])
    rescue ArgumentError
      nil
    end
  end


  def update_new_job job, new_job_hash
    logger.debug "DEBUG: new_job_hash --> #{new_job_hash.to_yaml}"
    job.update_attributes(new_job_hash)
    if job.errors.blank?
      job.save!
      flash[:success] = "Job saved!"
      flash.delete(:error)
      redirect_to job_index_path
    else
      @errors = job.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
    end

      @job = job
      render :action => :new
    end
  end

  def job_params
    params.require(:job).permit(:owner_id, :title, :description, :category, :deadline, :salary)
  end
end