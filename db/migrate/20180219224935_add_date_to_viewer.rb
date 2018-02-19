class AddDateToViewer < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :date_time, :datetime
  end
end
