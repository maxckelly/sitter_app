class SittersController < ApplicationController

  before_action :set_sitter, only: [ :show ]
  before_action :set_sitter, only: [ :show, :edit, :update, :destroy]
  before_action :set_sitter_view

  # GET /sitters
  # GET /sitters.json
  def index
    @sitters = Sitter.all
  end

  # GET /sitters/1
  # GET /sitters/1.json
  def show
  end

  # GET /sitters/new
  def new
    @sitter = Sitter.new
  end

  # GET /sitters/1/edit
  def edit
  end

  # POST /sitters
  # POST /sitters.json
  def create
    @sitter = Sitter.new(sitter_params)
    @sitter = current_user.sitters.new(sitter_params)

    if @sitter.save
      redirect_to @sitter
    else 
      render :new
    end
  end

  # PATCH/PUT /sitters/1
  # PATCH/PUT /sitters/1.json
  def update
    respond_to do |format|
      if @sitter.update(sitter_params)
        format.html { redirect_to @sitter, notice: 'Sitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitter }
      else
        format.html { render :edit }
        format.json { render json: @sitter.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def auth_view

  end

  # DELETE /sitters/1
  # DELETE /sitters/1.json
  def destroy
    @sitter.destroy
    respond_to do |format|
      format.html { redirect_to sitters_url, notice: 'Sitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # The below is saying If role_id = 2 (sitter) then you can view all of this controller, else  
    def set_sitter_view
      
      if current_user.role_id == 2
        
      else 
        redirect_to unauthorised_path()
      end
    end

    def set_sitter
      
      id = params[:id]
      @sitter = Sitter.find(params[:id])
      @sitter = current_user.sitters.find_by_id(id)
    end

    def set_user_parent
      id = params[:id]
      @sitter = current_user.sitters.find_by_id(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitter_params
      params.require(:sitter).permit(:name, :description, :email, :age, :location)
    end
end
