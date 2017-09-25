class AddSyncToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :sync, :text
  end
end
