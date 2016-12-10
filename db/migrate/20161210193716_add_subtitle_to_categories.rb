class AddSubtitleToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :subtitle, :string
  end
end
