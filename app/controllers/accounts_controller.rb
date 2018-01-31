class AccountsController < ApplicationController
  before_action :set_account, only: [ :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:index, :edit, :update, :destroy]
  before_action :get_blog
  include ApplicationHelper
  
  
  def portal_login
          @account = Account.where(domain: request.subdomain).first
            
         if params[:cookie] == @account.psw
            cookies.permanent.signed[:portal] = @account.psw
            redirect_to portal_path 
        
       else
         redirect_to portal_path , notice: 'Contraseña incorrecta' 
       end
  end  

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

   def portal
    @account = Account.where(domain: request.subdomain).first
    @events = @account1.events.where(state: 4).order(updated_at: :desc).search(params[:search])
    if cookies.permanent.signed[:portal] == @account.psw 
      @psw = true
    else
      @psw = false
    end
    
     
   end 
  

   def iframe
   
    @event = Event.where(iframe: params[:iframe]).first
    @account = Account.find(@event.account_id)
     if @event.has_ppts 
    @array = @event.slides.split(/,/)
    @count = @array.count
    @sync =  @event.sync
    end


  end  

  def live
    @nav =  request.user_agent
    a = @nav.upcase.include? "ANDROID"
    b = @nav.upcase.include? "IPHONE"
    puts a 
    puts b
       if   a  ||  b
      @navs = "SI"
    else
      @navs = "NO"
    end

    @account = Account.where(domain: request.subdomain).first
    @event = Event.where(account_id: @account.id).where(root_event: true).last
    @chat = @event.chats.order(created_at: :asc)
    puts @event
    puts Event.where(account_id: @account.id).where.not(state: 4).first
    puts "eventtttttttttttt"
    
    if @event != nil
         if @event.ppts_url != nil && @event.has_ppts 
             @array = @event.slides.split(/,/)
             @count = @array.count
         end
        
         render "live"
    
    else
      #render "no_live" , :layout => false
      redirect_to portal_path
    end
  end  

  def portal_show

    @nav =  request.user_agent
    a = @nav.upcase.include? "ANDROID"
    b = @nav.upcase.include? "IPHONE"
    puts a 
    puts b
       if   a  ||  b
      @navs = "SI"
    else
      @navs = "NO"
    end
   
    @event = Event.find(params[:id])
    @chat = @event.chats.order(created_at: :asc)
    @account = Account.find(@event.account_id)
     if @event.has_ppts && @event.slides != nil
    @array = @event.slides.split(/,/)
    @count = @array.count
    @sync =  @event.sync
    end
    @nav =  request.user_agent
   
   


  end  



  
  def portal_show_name
     
      a = params[:name]
      
      if a.include? "JGrix"

        @event = Event.where(iframe: params[:name]).first
        @account = Account.find(@event.account_id)
        if @event.has_ppts && @event.slides != nil
        @array = @event.slides.split(/,/)
        @count = @array.count
        @sync =  @event.sync

      end

      render 'iframe' , layout: 'iframe'
      else
        @event = Event.where(link: params[:name]).first
        @account = Account.find(@event.account_id)
        if @event.has_ppts && @event.slides != nil
        @array = @event.slides.split(/,/)
        @count = @array.count
        @sync =  @event.sync
      end
        render 'portal_show' 
      end  
    
    



  end  






  def portal_show_video
   
    @event = Event.find(params[:id])
    @account = Account.find(@event.account_id)
    @array = @event.slides.split(/,/)
    @count = @array.count
    @sync =  @event.sync

  end  

  def real_time_stats
    
    @event = Event.find(params[:id])
  end



    def cardinalchat
    


    @event = Event.find(params[:id])
    

    #arr = ["","https://farm5.staticflickr.com/4422/35665918493_1bde9dc8ed_b.jpg","https://farm5.staticflickr.com/4339/36474195705_74101edf7d_b.jpg","https://farm5.staticflickr.com/4424/35638778924_92f9d5e21d_b.jpg","https://farm5.staticflickr.com/4436/35639073234_326b80c92b_b.jpg","https://farm5.staticflickr.com/4362/36428484286_f22c9b770f_b.jpg","https://farm5.staticflickr.com/4382/35639127524_41193dbf80_b.jpg","https://farm5.staticflickr.com/4387/35666322323_b9b87e24b6_b.jpg","https://farm5.staticflickr.com/4345/36077419920_812fb91c10_b.jpg","https://farm5.staticflickr.com/4422/36077427050_b84bdf266c_b.jpg","https://farm5.staticflickr.com/4373/36474594225_fa08c3da0f_b.jpg","https://farm5.staticflickr.com/4386/36077439470_936283a0d5_b.jpg","https://farm5.staticflickr.com/4376/35639159574_567c80ed97_b.jpg","https://farm5.staticflickr.com/4337/35639163614_63ce4b90eb_b.jpg","https://farm5.staticflickr.com/4426/36474617395_e85421f18d_b.jpg","https://farm5.staticflickr.com/4434/36474626855_781d8f96b8_b.jpg","https://farm5.staticflickr.com/4406/36337236581_a91d5cd6b2_b.jpg","https://farm5.staticflickr.com/4353/36337242161_c9c07bc770_b.jpg","https://farm5.staticflickr.com/4355/35639211214_ec8b8dc215_b.jpg"]  
    msg = params[:msg]
    fecha = get_date_hora(Time.now)
    ar = [msg,fecha]
    Chat.create(event_id: @event.id, message: msg)
    Pusher.trigger('chat', 'msg', {
    message: ar
    


    });


  end


  # GET /accounts/1
  # GET /accounts/1.json
  def show

  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end


 def change_psw
    
    params[:value] == "true" ? val = true : val = false 
    Account.find(params[:id]).update(has_psw: val)
  
  end

   def change_net
    
    params[:value] == "true" ? val = true : val = false 
    Account.find(params[:id]).update(has_networks: val)
  
  end
   def change_questions
    
    params[:value] == "true" ? val = true : val = false 
    Account.find(params[:id]).update(questions: val)
  
  end
   def change_docs
    
    params[:value] == "true" ? val = true : val = false 
    Account.find(params[:id]).update(download_docs: val)
  
  end


  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:domain, :logo, :admin_user, :user_id, :background_portal, :background_stream, :name,  :chat, :facebook, :twitter, :instagram, :linkedin,:has_psw, :psw, :has_networks, :download_docs, :questions)
    end
end


