class AddRequiToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :requisitos, :string
  end
end
