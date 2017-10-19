class AddSocialToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :social, :boolean
  end
end
