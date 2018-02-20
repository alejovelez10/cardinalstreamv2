class ViewersController < ApplicationController
include ApplicationHelper
def new
  @viewer = Viewer.new
end

def create_viewer
   fecha = get_date_hora(Time.now)
  @viewer = Viewer.new(name: params[:name], email:params[:email], company: params[:company], event_id: params[:event_id], account_id: params[:account_id] , date_time: fecha)
  @event = Event.find(params[:event_id])
  if @viewer.save
  	viewer_sign_in(@viewer)
  	if (@event.root_event)
    redirect_to root_path
else
	redirect_to portal_show_path(@event.id)
  end
end
end

def delete_viewer 
        
        @viewer = Viewer.find(params[:id])
        @event_id = @viewer.event_id
        if @viewer.destroy
                redirect_to real_time_stats_path(@event_id)
            end
        
    end

private
  def user_params
    params.require(:viewer).permit(:email, :name)
  end

end
