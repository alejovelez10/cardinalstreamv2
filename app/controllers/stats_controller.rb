class StatsController < ApplicationController
  def index
  	@events = Event.where(admin_user: current_user.admin_user).order(views: :desc)
  end

  def create

  	@event = Event.find(params[:id])
  	date = DateTime.now
  	@stat = Stat.new(time_stat: date, type_stat: 0, event_id: @event.id, account_id: @event.account_id , event_name: @event.name, day: date.day, month: date.month, year: date.year, hour: date.hour)
  	@stat.save

  end	
end
