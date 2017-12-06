class AddPswToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :psw, :string
    add_column :accounts, :has_psw, :boolean
  end
end
