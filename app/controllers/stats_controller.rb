class StatsController < ApplicationController
  def index
  	@events = Event.where(admin_user: current_user.admin_user).order(views: :desc)
  	@eventm = Event.where(admin_user: current_user.admin_user).order(views: :desc).first
    
  end

   def csv
  	@events = Event.where(admin_user: current_user.admin_user).order(views: :desc)
    respond_to do |format|
       format.csv { send_data @events.to_csv, filename: "eventos.csv" }
       format.xls  #{ send_data @events.to_csv(col_sep: "\t") }
  end
end
  def csv_all
  	@stats = Stat.where(admin_user: current_user.admin_user).order(time_stat: :desc)
    respond_to do |format|
       format.csv { send_data @stats.to_csv, filename: "entradas.csv" }
       format.xls  #{ send_data @events.to_csv(col_sep: "\t") }
  end
    
  end

    

end
