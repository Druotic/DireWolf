class UserController < ApplicationController

  ##
  # Function to list all the users.
  # This is to be used by job seekers to list all the employers by name
  # TODO: a) Is this used yet? b) This seems like it should have a parameter that defaults to all and we specify
  # TODO: otherwise if we need only employers, only ___, and so on
  ##
  def index
    @users = User.get_all_employers
  end

  ##
  # Function for the editing of the used profile.
  # Uses the user_params for update.
  ##
  def edit

  end

  def update
    user = User.find(params["id"])
    update_user user, user_params
  end

  ##
  # Deletes a user.
  # A user may chose to terminate his association with the job portal.
  ##
  def destroy

  end

  ##
  # Function to update a resume.
  # User model accepts nested resources for resume.
  # One to One relationship for Resume and User.
  ##
  def update_resume

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  end

  def update_user user, user_hash
    logger.debug "DEBUG: user_update_hash --> #{user_hash.to_yaml}"
    user.update_attributes(user_hash)
    if user.errors.blank?
      user.save!
      flash.delete(:error)
      redirect_to root_path
    else
      @errors = job.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end

      @user = user
      render :action => :edit
    end
  end
end