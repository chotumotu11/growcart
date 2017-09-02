class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
