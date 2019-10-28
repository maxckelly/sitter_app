class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.role_id == 1
      parents_path()
    elsif current_user.role_id == 2
      sitters_path()
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # The below is saying if the below is being passed into the controller it will still succeed. Before we couldn't add extra inputs to the devise model.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role_id) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role_id, :name) }
  end
end
