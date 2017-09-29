class AddRootToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :root_event, :boolean
  end
end
