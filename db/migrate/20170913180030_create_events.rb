class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.time :date_event
      t.string :name
      t.text :description
      t.integer :state
      t.string :backgroud_event
      t.string :video
      t.string :ppts
      t.integer :user_id
      t.integer :admin_user
      t.integer :account_id

      t.timestamps
    end
  end
end
