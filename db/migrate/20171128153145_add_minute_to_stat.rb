class AddMinuteToStat < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :minute, :integer
    add_column :stats, :second, :integer
  end
end
