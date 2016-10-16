class CreateProducers < ActiveRecord::Migration[5.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :web_site
      t.string :image

      t.timestamps
    end
  end
end
