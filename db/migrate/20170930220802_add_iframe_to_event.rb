class AddIframeToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :iframe, :string
  end
end
