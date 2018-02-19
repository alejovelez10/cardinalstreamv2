class AddDateToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :date_time, :datetime
  end
end
