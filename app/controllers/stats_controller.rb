class StatsController < ApplicationController

def import
  Stat.import(params[:file], current_user.admin_user, current_user.admin_user )
  redirect_to stats_path, notice: "Estadisticas Importados"
end

   
  def index
  	@events = Event.where(admin_user: current_user.admin_user).order(views: :desc)
  	@eventm = Event.where(admin_user: current_user.admin_user).order(views: :desc).first
    @eventph = Stat.where(admin_user: current_user.admin_user).where(type_stat: 0).where(:second => (6..12)).count

    
  end

   def csv
  	@events = Event.where(admin_user: current_user.admin_user).where(type_stat: 0).order(views: :desc)
    respond_to do |format|
       format.csv { send_data @events.to_csv, filename: "eventos.csv" }
       format.xls  #{ send_data @events.to_csv(col_sep: "\t") }
  end
end
  def csv_all
  	@stats = Stat.where(admin_user: current_user.admin_user).where(type_stat: 0).order(time_stat: :desc)
    respond_to do |format|
       format.csv { send_data @stats.to_csv, filename: "entradas.csv" }
       format.xls  #{ send_data @events.to_csv(col_sep: "\t") }
  end
    
  end


  def create
    @event = Event.find(params[:id])
    date = DateTime.now
    views = @event.views != nil ? (@event.views + 1) : 1
    @event.update(views: views)
    date1 = date.year.to_s + "-" + date.month.to_s + "-" + date.day.to_s
    time1 = date.hour.to_s + ":" + date.minute.to_s + ":" + date.second.to_s
    Stat.create(admin_user: @event.admin_user,browser: request.user_agent, time_stat: date, type_stat: 0, event_id: @event.id, account_id: @event.account_id , event_name: @event.name, day: date.day, month: date.month, year: date.year, hour: date.hour,second: date.hour, state_date: date1)

  end

    

end
