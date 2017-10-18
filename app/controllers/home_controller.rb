class HomeController < ApplicationController
layout 'application'
  def index
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
