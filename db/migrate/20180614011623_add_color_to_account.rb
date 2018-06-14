class AddColorToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :color_one, :string
    add_column :accounts, :color_two, :string
    add_column :accounts, :color_three, :string
  end
end
