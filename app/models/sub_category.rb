# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_8e75c2ee78  (category_id => categories.id)
#

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
end
