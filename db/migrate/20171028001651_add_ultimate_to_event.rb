class AddUltimateToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :ultimate_ppt, :integer
  end
end
