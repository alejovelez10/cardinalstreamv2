class AddTimeToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :viewer_id, :integer
    add_column :chats, :date_time, :datetime
  end
end
