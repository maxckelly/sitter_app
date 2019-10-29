class PagesController < ApplicationController 

  def index
    @sitters = Sitter.all
  end 

  def unauthorised

  end
end