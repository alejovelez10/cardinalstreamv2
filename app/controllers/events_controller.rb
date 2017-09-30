class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :get_blog
  before_action :authenticate_user!



  # GET /events
  # GET /events.json
  def index
    @events = Event.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 10).order(created_at: :DESC)
    puts current_user.email
  end

  def admin
    @events = Event.where(admin_user: current_user.admin_user).paginate(page: params[:page],:per_page => 10).order(created_at: :DESC)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.last
    @account = Account.find(@event.account_id)
    @array = @event.slides.split(/,/)
    @count = @array.count


  end

  # GET /events/new
  def new
    @event = Event.new
    @account = Account.where(admin_user: current_user.admin_user).first
    @state = params[:state]
  end

  # GET /events/1/edit
  def edit
    @account = Account.where(admin_user: current_user.admin_user).first
    @state = @event.state
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    sync = ""
    respond_to do |format|
      if @event.save
        #Crea carpeta para guardar ppts
        `mkdir public/uploads/event/ppts/#{@event.id}/ppt`
        #Convierte ppts en imagenes 
        `convert  public/uploads/event/ppts/#{@event.id}/event.pdf  public/uploads/event/ppts/#{@event.id}/ppt/ppt.png` 
        #Cuenta el numero de diapositivas
        file_count = Dir.glob(File.join("public/uploads/event/ppts/#{@event.id}/ppt", '**', '*')).select { |file| File.file?(file) }.count
        ppts = Array.new
        pptss = ""
        #Crea un string con las rutas de las imagenes y inicializa las sincronizacion en 0
        for i in 0..(file_count - 1)
           pptss = pptss + "/uploads/event/ppts/#{@event.id}/ppt/ppt-#{i}.png,"
           sync = sync + "0,"
        end
        ppts = pptss.split(/,/)
        @event.slides = pptss
        @event.sync = sync
        @event.save
        tv = `ffprobe -v error -select_streams v:0 -show_entries stream=duration \ -of default=noprint_wrappers=1:nokey=1 public/uploads/event/video/#{@event.id}/default.mp4`
        tvi = (tv.to_i/2)
        puts tvi
        tvisi =  Time.at(tvi).utc.strftime("%H:%M:%S")  
        puts tvisi
        `ffmpeg -i  public/uploads/event/video/#{@event.id}/default.mp4 -r 1 -ss #{tvisi} -t 1 public/uploads/event/video/#{@event.id}/screamshot.jpg` if  !@event.event_type
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
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
        #Elimina el folder con las ppt para luego volver a crearlos
        `rm -rf public/uploads/event/ppts/#{@event.id}/ppt`
        `mkdir public/uploads/event/ppts/#{@event.id}/ppt`
        `convert  public/uploads/event/ppts/#{@event.id}/event.pdf  public/uploads/event/ppts/#{@event.id}/ppt/ppt.png`
        file_count = Dir.glob(File.join("public/uploads/event/ppts/#{@event.id}/ppt", '**', '*')).select { |file| File.file?(file) }.count
        ppts = Array.new
        pptss = ""
        for i in 0..(file_count - 1)
           pptss = pptss + "/uploads/event/ppts/#{@event.id}/ppt/ppt-#{i}.png,"
        end
        ppts = pptss.split(/,/)
        @event.slides = pptss
        @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
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



  def cardinalppt
    @event = Event.last
    @account = Account.find(@event.account_id)
    @array = @event.slides.split(/,/)
    @count = @array.count
    #arr = ["","https://farm5.staticflickr.com/4422/35665918493_1bde9dc8ed_b.jpg","https://farm5.staticflickr.com/4339/36474195705_74101edf7d_b.jpg","https://farm5.staticflickr.com/4424/35638778924_92f9d5e21d_b.jpg","https://farm5.staticflickr.com/4436/35639073234_326b80c92b_b.jpg","https://farm5.staticflickr.com/4362/36428484286_f22c9b770f_b.jpg","https://farm5.staticflickr.com/4382/35639127524_41193dbf80_b.jpg","https://farm5.staticflickr.com/4387/35666322323_b9b87e24b6_b.jpg","https://farm5.staticflickr.com/4345/36077419920_812fb91c10_b.jpg","https://farm5.staticflickr.com/4422/36077427050_b84bdf266c_b.jpg","https://farm5.staticflickr.com/4373/36474594225_fa08c3da0f_b.jpg","https://farm5.staticflickr.com/4386/36077439470_936283a0d5_b.jpg","https://farm5.staticflickr.com/4376/35639159574_567c80ed97_b.jpg","https://farm5.staticflickr.com/4337/35639163614_63ce4b90eb_b.jpg","https://farm5.staticflickr.com/4426/36474617395_e85421f18d_b.jpg","https://farm5.staticflickr.com/4434/36474626855_781d8f96b8_b.jpg","https://farm5.staticflickr.com/4406/36337236581_a91d5cd6b2_b.jpg","https://farm5.staticflickr.com/4353/36337242161_c9c07bc770_b.jpg","https://farm5.staticflickr.com/4355/35639211214_ec8b8dc215_b.jpg"]  

     b = params[:id]
     c = b.to_i
     a = @array[c]
     ar = [a,c]
    puts params[:id]
     Pusher.trigger('my-channel', 'my-event', {
      message: ar
    })


  end

  def ppts_views
    @event = Event.find(params[:id])
    @array = @event.slides.split(/,/)
    @sync =  @event.sync.split(/,/)
    @count = @array.count
    @horas = Array.new
    @minutos = Array.new
    @segundos = Array.new
    for i in 0..(@count - 1)
      
      hms =  Time.at(@sync[i].to_i).utc.strftime("%H:%M:%S")
      arrays = hms.split(/:/)
      @horas[i] = arrays[0]
      @minutos[i] = arrays[1]
      @segundos[i] = arrays[2]

    
    end
    @id = params[:id]
  end

  def sinc_ppts
    @event = Event.find(params[:id])
    puts "hola"
    pptss = ""
    a = params[:count].to_i
    for i in 0..(a-1)
     b = "#{params[:Hora_ids][i]}:#{params[:Minuto_ids][i]}:#{params[:Segundo_ids][i]}" 
     puts b
     c =  b.split(':').map { |a| a.to_i }.inject(0) { |a, b| a * 60 + b}
     pptss = pptss + c.to_s + ","
    end
    puts pptss
    array = pptss.split(/,/)
    @event.sync = pptss
    @event.save
    puts array
    redirect_to events_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date_event, :name, :description, :state, :backgroud_event, :video, :ppts, :user_id, :admin_user, :account_id, :event_type, :event_date, :delay)
    end
  



end
