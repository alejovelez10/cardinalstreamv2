class AddEventidToViewer < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :event_id, :integer
    add_column :viewers, :account_id, :integer
  end
end
