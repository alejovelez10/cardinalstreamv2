class AddTypeEventToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_type, :boolean
  end
end
