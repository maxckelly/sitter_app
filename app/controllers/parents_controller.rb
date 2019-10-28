class ParentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_parent, only: [ :show]
  before_action :set_user_parent, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_view

  # GET /parents
  # GET /parents.json
  def index
    @parent = current_user.parent
    @meetings = current_user.meetings
  end

  # GET /parents/1
  # GET /parents/1.json
  def show

  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
    # The below is a way to create the sitter when its a one-to-one

    @user = current_user
    @parent = Parent.create(parent_params)
    @user.parent = @parent

    if @parent.save
      redirect_to @parent
    else 
      render :new
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    # The below verifies if the current user is a parent and if so they can access all of the parents pages.
    def set_parent_view

      if current_user.role_id == 1
        
      else 
        redirect_to unauthorised_path()
      end
    end

    def set_parent
      id = params[:id]
      # The below is a way to find the parent when its a one-to-one
      @parent = Parent.find_by_user_id(current_user.id)
    end

    def set_user_parent
      id = params[:id]
      @parent = Parent.find_by_user_id(current_user.id)
    end

    def parent_params
      params.require(:parent).permit(:mother_name, :father_name, :children, :description, :location, :picture)
    end
end
