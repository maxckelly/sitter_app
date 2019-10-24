class ApplicationController < ActionController::Base

   def after_sign_in_path_for(resource)
    parents_home_path(current_user)
  end

end
