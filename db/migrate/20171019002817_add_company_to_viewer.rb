class AddCompanyToViewer < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :company, :string
  end
end
