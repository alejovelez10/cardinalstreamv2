class CreateRols < ActiveRecord::Migration[5.1]
  def change
    create_table :rols do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :name
      t.text :description
      t.boolean :create_event
      t.boolean :edit_event
      t.boolean :delete_event
      t.boolean :admin_event
      t.boolean :admin_stats
      t.boolean :admin_config
      t.boolean :admin_users

      t.timestamps
    end
  end
end
