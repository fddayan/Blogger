module ApplicationHelper
  def after_sign_in_path_for(user)
    user_path user
  end

end
