class HomeController < ApplicationController

  def index
    debug_info = "DEBUG: HomeController roles - "
    current_user.roles.each { |role| debug_info << role.name << "," }
    logger.debug debug_info

    if current_user.is_admin?
      redirect_to admin_home_index_path
    end
  end

end