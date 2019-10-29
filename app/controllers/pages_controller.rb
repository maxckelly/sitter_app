class PagesController < ApplicationController 

  before_action :set_user
  
  def index
    @sitters = Sitter.all
  end 

  def unauthorised

    
  end

  private 
  def set_user
      id = params[:id]
      @parent = Parent.find_by_user_id(current_user.id)
      @sitter = Sitter.find_by_user_id(current_user.id)
    end
end