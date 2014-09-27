class UserController < ApplicationController

  ##
  # Function to list all the users.
  # This is to be used by job seekers to list all the employers by name
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
    params.require(:user).permit(:name, :email, :phone, :resume)
  end
end