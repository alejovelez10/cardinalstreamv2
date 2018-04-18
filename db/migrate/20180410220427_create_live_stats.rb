class CreateLiveStats < ActiveRecord::Migration[5.1]
  def change
    create_table :live_stats do |t|
      t.integer :type_stat
      t.integer :event_id
      t.integer :account_id
      t.string :event_name
      t.string :account_name
      t.integer :day
      t.integer :month
      t.integer :year
      t.integer :hour
      t.integer :minute
      t.integer :second
      t.datetime :time_stat
      t.date :state_date
      t.time :state_time

      t.timestamps
    end
  end
end
