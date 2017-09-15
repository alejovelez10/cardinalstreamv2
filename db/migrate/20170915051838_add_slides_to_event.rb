class AddSlidesToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :slides, :text
  end
end
