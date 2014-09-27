module JobHelper

  def can_post_new_job?
    current_user.can_publish?
  end
end
