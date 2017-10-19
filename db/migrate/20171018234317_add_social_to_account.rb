class AddSocialToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :facebook, :string
    add_column :accounts, :instagram, :string
    add_column :accounts, :twitter, :string
    add_column :accounts, :linkedin, :string
  end
end
