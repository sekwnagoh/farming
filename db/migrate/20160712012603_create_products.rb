class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category
      t.string :name
      t.text :description
      t.string :picture
      t.string :summary

      t.timestamps null: false
    end
  end
end
