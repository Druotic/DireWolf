class HomeController < ApplicationController
  def index
    if current_user.is_admin?
      redirect_to admin_home_index_path
    else
      redirect_to root_path
    end
  end
end