class AddEventDateToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_date, :datetime
  end
end
