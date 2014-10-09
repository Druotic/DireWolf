class ResumeController < ApplicationController

  include ApplicationHelper
  skip_before_filter :authenticate_user!, :only => [:index, :show]

  def index
    @resume = current_user.resume
  end

  def new
    @resume = Resume.new
  end

  def create
    resume = Resume.new
    @errors = []
    ActiveRecord::Base.transaction do
      update_new_resume resume, resume_params
    end
  end

  def edit
    @resume = current_user.resume
  end

  def update
    resume = Resume.find(:id=>params[:id])
    update_new_resume resume, resume_params
  end

  def show
    @resume = Resume.find(params["id"].to_i)
  end

  private

  def update_new_resume resume, new_resume_hash
    new_resume_hash[:owner_id] = current_user.id
    resume.update_attributes(new_resume_hash)
    if resume.errors.blank?
      resume.save!
      flash[:notice] = "Resume successfully updated"
      redirect_to resume_path(resume.id)
    else
      @errors = resume.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end
      redirect_to new_resume_path
    end
  end

  def resume_params
    params.require(:resume).permit(:title, :body)
  end
end