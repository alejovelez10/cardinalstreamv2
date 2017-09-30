class AddDelayToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :delay, :integer
  end
end
