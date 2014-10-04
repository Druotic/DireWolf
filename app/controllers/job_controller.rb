class JobController < ApplicationController

  skip_before_filter :authenticate_job!, :only => [:index]

  autocomplete :category, :name, :full => true

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
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
      puts @jobs
    elsif current_user.is_jobseeker?
      @jobs = current_user.jobs
    end
  end

  def create
    job = Job.new
    category = Category.find_or_create_by(:name => job_params[:category])

    update_params = job_params
    update_params[:owner_id] = current_user.id

    update_params[:category_id] = category.id
    update_params.delete(:category)
    update_params[:deadline] = format_date job_params[:deadline]

    update_new_job job, update_params

  end

  def apply
    if current_user.is_jobseeker?
      current_user.jobs << Job.find(params[:job_id])
      redirect_to job_index_path
    else
      flash[:notice] = "You are not allowed to apply for the job. Please create a new jobseeker account."
      redirect_to root_path
    end
  end

  def destroy

  end

  private

  # Checks format of date, returns nil is bad format.
  # TODO: Using rescue seems smelly, improve? (Also see validation in model)
  def format_date date
    begin
      DateTime.strptime(job_params[:deadline], '%m-%d-%Y')
    rescue ArgumentError
      nil
    end
  end


  def update_new_job job, new_job_hash
    logger.debug "DEBUG: new_job_hash --> #{new_job_hash.to_yaml}"
    job.update_attributes(new_job_hash)
    if job.errors.blank?
      job.save!
      redirect_to job_index_path
    else
      @errors = job.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end
      redirect_to new_job_path
    end
  end

  def job_params
    params.require(:job).permit(:owner_id, :title, :description, :category, :deadline, :salary)
  end
end