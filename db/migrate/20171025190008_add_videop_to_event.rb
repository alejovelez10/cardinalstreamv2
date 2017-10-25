class AddVideopToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :video_p, :string
  end
end
