# == Schema Information
#
# Table name: producers
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  description :text
#  web_site    :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Producer < ApplicationRecord
  include Imageable
 
  has_many :products

  validates :name, :slug, presence: true
end
