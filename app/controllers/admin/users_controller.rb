class Admin::UsersController < Admin::ApplicationController

  autocomplete :role, :name, :full => true

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    @errors = []
    ActiveRecord::Base.transaction do
      update_new_user user, user_params
    end
    redirect_to admin_home_index_path if @errors.blank?
  end

  private

  def update_new_user user, new_user_hash
    role_hash = new_user_hash["role"]
    new_user_hash = new_user_hash.slice!("role")
    puts "##############################################################################################################\n"
    puts new_user_hash
    puts "##############################################################################################################"
    user.update_attributes(new_user_hash)



    if user.errors.blank?
      user.save!
      user.roles << Role.find(role_hash[:id])
    else
      @errors = user.errors.full_messages
      @errors.each do |e|
        flash[:error] = e
      end
      redirect_to new_admin_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name,  :phone, :email, :password, :password_confirmation, {:role => [:id, :role]})
  end

  # def role_params
  #   params.require(:role).permit(:id, :name)
  # end
end