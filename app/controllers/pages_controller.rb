class PagesController < ApplicationController 
  def index
    @meetings = Meeting.all
  end 

  def user_login_stage

  end
end