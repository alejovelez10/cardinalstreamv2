class AddRolTipeEventToRol < ActiveRecord::Migration[5.1]
  def change
    add_column :rols, :admin_ondemand, :boolean
    add_column :rols, :admin_live, :boolean
  end
end
