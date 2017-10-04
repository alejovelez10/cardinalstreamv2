class AddHasPPtsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :has_ppts, :boolean
    add_column :events, :has_register, :boolean
  end
end
