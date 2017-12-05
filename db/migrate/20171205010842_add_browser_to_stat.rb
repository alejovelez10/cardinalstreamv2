class AddBrowserToStat < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :browser, :string
  end
end
