class StatsController < ApplicationController
  def index
  end

  def create

  	@event = Event.find(params[:id])
  	date = DateTime.now
  	date.min < 10 ? min = "0" : min = ""
    date.hour < 10 ? hora = "0" : hora = ""
  	date1 = "#{date.year}-#{date.month}-#{date.day}T#{hora}#{date.hour}:#{min}#{date.min}:00-05:00"
  	@stat = Stat.new(time_stat: date1, type_stat: 0, event_id: @event.id, account_id: @event.account_id , event_name: @event.name, day: date.day, month: date.month, year: date.year, hour: date.hour)
  	@stat.save

  end	
end
