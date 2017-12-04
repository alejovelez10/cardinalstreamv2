class AddFechaToStat < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :state_date, :date
    add_column :stats, :state_time, :time
  end
end
