class AddFontToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :font_size, :integer
    add_column :events, :backgroud_font, :string
  end
end
