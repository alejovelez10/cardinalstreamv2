class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :domain
      t.string :logo
      t.integer :admin_user
      t.integer :user_id
      t.string :background_portal
      t.string :background_stream
      t.string :name
      t.boolean :questions
      t.boolean :download_docs
      t.boolean :chat

      t.timestamps
    end
  end
end
