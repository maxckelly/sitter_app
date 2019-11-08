class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
  end

  def update_phone_number
    current_user.update_attribute(suser_params)
    current_user.generate_pin
    current_user.send_pin

      redirect_to edit_user_registration_path, notice: "Saved..."
    rescure Exception => e
      redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

  def verify_phone_number

    current_user.verify_pin(params[:user][:pin])

    if current_user.phone_verified
      flash[:notice] = "Your phone number is verified"
    else
      flash[:notice] = "Cannot verify your phone number"
    end

    redirect_to edit_user_registration_path

    rescure Exception => e
      redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

  private

    def user_params
      params.require(:user).permit(:phone_number, :pin)
    end
end