class AddHaschatToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :has_chat, :boolean
    add_column :events, :height_banner, :integer
  end
end
