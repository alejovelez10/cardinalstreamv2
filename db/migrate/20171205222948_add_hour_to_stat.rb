class AddHourToStat < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :hours, :integer
  end
end
