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
      update_new_resume resume, params["resume"]
    end
    redirect_to create_redirector_path if @errors.blank?
  end

  def show
    resume = Resume.find(params["id"].to_i)
    render :partial => "show_resume", :locals => {:resume => resume}
  end

  private

  def update_new_resume resume, new_resume_hash
    Resume.update_attributes(new_resume_hash)
    if Resume.errors.blank?
      Resume.owner_id = current_user.id
      current_user.can_publish? ? (Resume.draft = false) : (Resume.draft = true)
      Resume.save!
    else
      @errors = Resume.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end
      redirect_to new_resume_path
    end
  end
end