# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string
#  product_type    :integer
#  weight          :integer
#  description     :text
#  image           :string
#  slug            :string
#  sub_category_id :integer
#  producer_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_products_on_producer_id      (producer_id)
#  index_products_on_sub_category_id  (sub_category_id)
#
# Foreign Keys
#
#  fk_rails_71fd4d9cb4  (producer_id => producers.id)
#  fk_rails_db9640ef46  (sub_category_id => sub_categories.id)
#

class Product < ApplicationRecord
  belongs_to :producer

  # two lines below together implement belongs_to(:category, through: :sub_category) concept
  belongs_to :sub_category
  has_one :category, through: :sub_category
end
