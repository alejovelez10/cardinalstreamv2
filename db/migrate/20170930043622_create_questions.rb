class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :event_id
      t.integer :account_id
      t.string :name
      t.string :email
      t.text :description
      t.string :affair

      t.timestamps
    end
  end
end
