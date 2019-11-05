class PagesController < ApplicationController 

  before_action :set_user

  def index
    @sitters = Sitter.all
  end 

  def unauthorised

  end

  def email_confirmed

  end

  private 

    def set_user
      if user_signed_in?
        id = params[:id]
        @parent = Parent.find_by_user_id(current_user.id)
        @sitter = Sitter.find_by_user_id(current_user.id)
      end
    end
end