class ApplicationController < ActionController::Base

  def after_sign_up_path_for(resource)
    user_login_stage_path(current_user)
  end
end
