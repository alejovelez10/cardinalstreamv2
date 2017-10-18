class CreateAskEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :ask_emails do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :event_id
      t.integer :account_id
      t.string :email
      t.string :comment

      t.timestamps
    end
  end
end
