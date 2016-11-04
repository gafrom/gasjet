class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :product_type
      t.integer :weight
      t.text :description
      t.string :image
      t.string :slug
      t.references :category, foreign_key: true
      t.references :producer, foreign_key: true

      t.timestamps
    end
  end
end
