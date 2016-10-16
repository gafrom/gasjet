class Category < ApplicationRecord
  has_many :sub_categories
  has_many :products, through: :sub_categories
end
