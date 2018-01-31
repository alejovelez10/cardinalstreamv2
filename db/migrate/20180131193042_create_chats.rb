class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.integer :event_id
      t.string :name
      t.text :message
      t.string :company
      t.string :email

      t.timestamps
    end
  end
end
