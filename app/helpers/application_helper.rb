module ApplicationHelper

  def create_redirector_path
    current_user.is_admin? ? admin_home_index_path : root_path
  end
end
