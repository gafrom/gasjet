class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
