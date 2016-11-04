# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  product_type :integer
#  weight       :integer
#  description  :text
#  image        :string
#  slug         :string
#  category_id  :integer
#  producer_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  index_products_on_producer_id  (producer_id)
#
# Foreign Keys
#
#  fk_rails_71fd4d9cb4  (producer_id => producers.id)
#  fk_rails_fb915499a4  (category_id => categories.id)
#

class Product < ApplicationRecord
  include Imagable

  belongs_to :producer
  belongs_to :category

  validates :name, :slug, presence: true
end
