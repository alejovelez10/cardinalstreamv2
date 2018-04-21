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
    elsif (controller_name == 'accounts' and (action_name == "portal_show_video" || action_name == "portal_show_name" ||  action_name == "portal_show" || action_name == "live"))

      'streaming'
      elsif (controller_name == 'accounts' and ( action_name == "portal")) || (controller_name == "events" && (action_name == "show" || action_name == "show_admin"))

      'portal'

    elsif (action_name == "iframe")
    'iframe'

     elsif (action_name == "real_time_stats")
    'stats'

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



def viewer_sign_in(viewer)
  cookies.permanent.signed[:viewer_id] = viewer.id
  @current_viewer = viewer
end

def viewer_sign_out
  cookies.delete(:viewer_id)
  @current_viewer = nil
end

private
  def viewer_signed_in?
    !current_viewer.nil?
  end
  helper_method :viewer_signed_in?

  def current_viewer
    @current_viewer ||= Viewer.find(cookies.signed[:viewer_id]) if cookies.signed[:viewer_id]
  rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_viewer
end
