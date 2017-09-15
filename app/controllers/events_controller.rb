class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @account = Account.where(admin_user: current_user.admin_user).first
  end

  # GET /events/1/edit
  def edit
    @account = Account.where(admin_user: current_user.admin_user).first
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    
    respond_to do |format|
      if @event.save
        `mkdir public/uploads/event/ppts/#{@event.id}/ppt`
        `convert  public/uploads/event/ppts/#{@event.id}/event.pdf  public/uploads/event/ppts/#{@event.id}/ppt/ppt.png`
        file_count = Dir.glob(File.join("public/uploads/event/ppts/#{@event.id}/ppt", '**', '*')).select { |file| File.file?(file) }.count
        puts file_count
        ppts = Array.new
        pptss = ""
        for i in 0..(file_count - 1)
           pptss = pptss + "/uploads/event/ppts/#{@event.id}/ppt/ppt-#{i}.png,"
        end
        puts pptss
        ppts = pptss.split(/,/)
        @event.slides = pptss
        @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        `rm -rf public/uploads/event/ppts/#{@event.id}/ppt`
        `mkdir public/uploads/event/ppts/#{@event.id}/ppt`
        `convert  public/uploads/event/ppts/#{@event.id}/event.pdf  public/uploads/event/ppts/#{@event.id}/ppt/ppt.png`
        file_count = Dir.glob(File.join("public/uploads/event/ppts/#{@event.id}/ppt", '**', '*')).select { |file| File.file?(file) }.count
        puts file_count
        ppts = Array.new
        pptss = ""
        for i in 0..(file_count - 1)
           pptss = pptss + "/uploads/event/ppts/#{@event.id}/ppt/ppt-#{i}.png,"
        end
        puts pptss
        ppts = pptss.split(/,/)
        @event.slides = pptss
        @event.save
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date_event, :name, :description, :state, :backgroud_event, :video, :ppts, :user_id, :admin_user, :account_id)
    end
end
