class ViewerSessionsController < ApplicationController
  def new
  end



 


def destroy
 @event = Event.find(params[:event_id])
  viewer_sign_out

  	if (@event.root_event)
    redirect_to root_path
else
	redirect_to portal_show_path(@event.id)
  end
end
end
