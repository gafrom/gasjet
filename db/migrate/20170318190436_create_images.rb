class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :filename
      t.string :original_filename
      t.string :imageable_type
      t.integer :imageable_id

      t.timestamps
    end
  end
end
