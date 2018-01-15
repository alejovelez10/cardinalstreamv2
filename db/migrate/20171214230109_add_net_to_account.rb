class AddNetToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :has_networks, :boolean
  end
end
