class AddStreamingnameToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :name_stream, :string
  end
end
