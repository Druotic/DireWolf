class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(registration_params)

    if @user.errors.blank?
      @user.roles << Role.find_by(:name => "Jobseeker")
      sign_in @user
      UserMailer.welcome_mailer(@user).deliver
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end
      redirect_to new_user_registration_path
    end
  end

  private
  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
  end
end