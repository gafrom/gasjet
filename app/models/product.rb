class Product < ApplicationRecord
  belongs_to :producer

  # two lines below together implement belongs_to(:category, through: :sub_category) concept
  belongs_to :sub_category
  has_one :category, through: :sub_category
end
