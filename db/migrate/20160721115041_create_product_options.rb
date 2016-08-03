class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.integer :price, null: false
      t.integer :grade
      t.integer :weight
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
