class CreateEventFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :event_files do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :event_id
      t.integer :account_id
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
