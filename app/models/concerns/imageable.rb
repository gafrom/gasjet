module Imageable
  extend ActiveSupport::Concern

  included do
    has_many :images, dependent: :destroy, as: :imageable

    accepts_nested_attributes_for :images, reject_if: :image_has_no_file
  end

  def image
    images.first
  end

  private

  def image_has_no_file(attributes)
    attributes['file'].blank?
  end

  # base.select { |b| b.image_before_type_cast }.each { |r| r.images.create(filename: image_before_type_cast, original_filename: image_before_type_cast) }
end
