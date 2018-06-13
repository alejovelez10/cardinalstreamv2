class HomeController < ApplicationController

  def index
   @account1 = Account.where(domain: request.subdomain).first
   @events_o = @account1.events.where(state: 4)
   @events_p = @account1.events.where(state: 0)
   @events_l = @account1.events.where(state: 1)
   @events_plc = @account1.events.where(state: 1).or(@account1.events.where(state: 0)).count
   @events_pl = @account1.events.where(state: 1).or(@account1.events.where(state: 0))
   @events_first = @account1.events.where(state: 1).or(@account1.events.where(state: 0)).order(event_date: :asc).order(state: :desc).first
   @events_seconds = @account1.events.where(state: 1).or(@account1.events.where(state: 0)).where("id != ?", @events_first.id).order(event_date: :asc).order(state: :desc) if @events_first != nil
end

  def cuenta

    render layout: "application"
      
  end

  def redir
   
   #Busca si existe el dominio que voy a crear     
   account = Account.where(domain: params[:domain])
   #si existe va al siguiente pasa para crear la cuenta
   if account.count == 0
         @error = false
         @domain = ""
         if request.subdomain == ''
       
             redirect_to  new_user_registration_url(subdomain: "#{params[:domain]}")

  	     end
  	#sino existe renderea nuevamente la vista y muestra el error     
    else
         @domain = params[:domain]
         @error = true    
         render :index

  	end

  end
end
