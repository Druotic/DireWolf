module Admin
  class ApplicationController < ::ApplicationController
    before_filter :restrict_access!

    private
    def restrict_access!
      unless current_user.is_admin?
        flash[:notice] = "You are not authorised to view this page"
        redirect_to root_path
      end
    end
  end
end
