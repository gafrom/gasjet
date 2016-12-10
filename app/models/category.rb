# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  image       :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subtitle    :string
#
# Indexes
#
#  index_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_09a423a16c  (category_id => categories.id)
#

class Category < ApplicationRecord
  include Imagable

  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'category_id'

  has_many :products

  validates :name, :slug, presence: true
end
