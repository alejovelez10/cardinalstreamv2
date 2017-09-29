class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?  

  protected

  def configure_permitted_parameters
    [:account_update,:sign_up].each do |metodo|
    devise_parameter_sanitizer.permit(metodo, keys: [:email,:is_account,:account_domain,:names,:last_names,:admin_user,:rol_id,:avatar,:state,:count,:super_admin])
    end
  end  


layout :layout_for_selection
protected
  def layout_for_selection
    if controller_name == 'sessions'  || controller_name == 'passwords' 
      'application'
    elsif controller_name == 'registrations'

        if action_name == "new" || action_name == "create"
            'application'
            else
            	'admin'
        end
    elsif (controller_name == 'accounts' and (action_name == "portal_show_video" || action_name == "portal_show" || action_name == "live")) 
      
      'streaming'
      elsif (controller_name == 'accounts' and ( action_name == "portal" || action_name == "live")) || (controller_name == "events" && action_name == "show")
      
      'portal'
    else
      'admin'
  
    end
  end


  private
  def get_blog

    account = Account.where(domain: request.subdomain)
    puts request.subdomain
    if account.count > 0
      @account1 = account.first

    elsif request.subdomain != 'www'
      redirect_to home_url(subdomain: '')

    end
  end
end


