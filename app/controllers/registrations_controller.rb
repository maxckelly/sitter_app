class RegistrationsController < Devise::RegistrationsController
 
  private

  def after_sign_up_path_for(resource)
    if current_user.role_id == 1 
      parents_new_path()
    elsif current_user.role_id == 2
      new_sitter_path()
    end
  end  
end
