class MeetingsController < ApplicationController

  before_action :set_meeting_view
  before_action :set_meeting, only: [ :show, :edit, :update, :destroy ]
  before_action :set_user_meeting, only: [ :new, :create, :edit, :update, :destory, :show ]

  # GET /meetings
  # GET /meetings.json
  def index
    @parent = current_user.parent
    @sitter = current_user.sitter
    @meetings = current_user.meetings
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    # @sitter = Sitter.find(params[:sitter_user_id])
    @sitter = @meeting.sitter_user
  end

  # GET /meetings/new
  def new
    id = params[:id]
    @sitter = Sitter.find(params[:sitter_id])
    @parent = Parent.find_by_user_id(current_user.id)
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create

    @meeting = Meeting.new(meeting_params)
    @meeting = current_user.meetings.new(meeting_params)
    @meeting.parent_user = @parent
    @parent = Parent.find(meeting_params[:parent_user_id])
    @sitter = Sitter.find(meeting_params[:sitter_user_id])
 
    respond_to do |format|
      if @meeting.save
        
        format.html { redirect_to meetings_show_path(@meeting.id, @sitter.id, @parent.id), notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_meeting_view
      if user_signed_in?
        
      else 
        redirect_to new_user_session_path()
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Grabbing the user ID params
    def set_user_meeting
      id = params[:id]
      @parent = Parent.find_by_user_id(current_user.id)
      @sitter = Sitter.find_by_user_id(current_user.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :parent_user_id, :sitter_user_id, :location)
    end
end
