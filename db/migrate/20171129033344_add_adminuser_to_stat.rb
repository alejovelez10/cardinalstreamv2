class AddAdminuserToStat < ActiveRecord::Migration[5.1]
  def change
    add_column :stats, :admin_user, :integer
  end
end
