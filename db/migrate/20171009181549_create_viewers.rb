class CreateViewers < ActiveRecord::Migration[5.1]
  def change
    create_table :viewers do |t|
      t.string :email, limit: 100
      t.string :name, limit: 100
      t.string :altitud
      t.string :longitud
      t.string :ciudad

      t.timestamps
    end
  end
end
