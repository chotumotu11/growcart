class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price, precision: 10, scale: 2
      t.string :description
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
