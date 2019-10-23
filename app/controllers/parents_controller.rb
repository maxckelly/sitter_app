class ParentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_parent, only: [ :show ]
  before_action :set_user_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  # GET /parents.json
  def index

    @parents = current_user.parents

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

    @parent = Parent.new(parent_params)
    @parent = current_user.parents.new(parent_params)

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
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      id = params[:id]
      @parent = Parent.find(params[:id])

      @parent = current_user.parents.find_by_id(id)
    end

    def set_user_parent
      id = params[:id]
      @parent = current_user.parents.find_by_id(id)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:mother_name, :father_name, :children, :description, :location)
    end
end
