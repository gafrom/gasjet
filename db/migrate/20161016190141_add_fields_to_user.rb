class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :gender, :integer
    add_column :users, :city, :string
    add_column :users, :role, :integer, default: 0
  end
end
