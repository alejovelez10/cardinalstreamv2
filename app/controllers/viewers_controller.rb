class ViewersController < ApplicationController

def new
  @viewer = Viewer.new
end

def create_viewer
  @viewer = Viewer.new(name: params[:name], email:params[:email], company: params[:company], event_id: params[:event_id], account_id: params[:account_id])
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

private
  def user_params
    params.require(:viewer).permit(:email, :name)
  end

end
