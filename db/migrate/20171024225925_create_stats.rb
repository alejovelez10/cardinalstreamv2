class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :type_stat
      t.integer :event_id
      t.integer :account_id
      t.string :event_name
      t.string :account_name
      t.string :day
      t.string :month
      t.string :year
      t.string :hour
      t.datetime :time_stat

      t.timestamps
    end
  end
end


