class AddHasSocialToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :has_files, :boolean
    add_column :events, :has_question, :boolean
  end
end
