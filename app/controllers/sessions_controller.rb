class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      resource.is_admin? ? admin_home_index_path : root_path
    else
      super
    end
  end
end