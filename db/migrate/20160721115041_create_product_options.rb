class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.string :weight
      t.string :grade
      t.integer :price
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
