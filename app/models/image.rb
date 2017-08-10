# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  filename          :string
#  original_filename :string
#  imageable_type    :string
#  imageable_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Image < ApplicationRecord
  DATA_DIR = ENV['RAILS_DATA_DIR'] || Rails.root.join('public')
  ROOT_DIR = Pathname.new(DATA_DIR).join('uploads', 'images')

  attr_accessor :file

  belongs_to :imageable, polymorphic: true, optional: true, touch: true

  validate :file_format_validation

  before_save :load_image
  before_destroy :delete_image_file, if: :persisted?

  def url
    "/uploads/images/#{imageable_folder_name}/#{filename}"
  end

  def empty?
    !persisted? && !file
  end

  private

  def load_image
    return if file.blank?

    self.original_filename = file.original_filename
    ext = original_filename.split('.').last
    self.filename = "#{SecureRandom.hex}.#{ext}"

    directory = ROOT_DIR.join imageable_folder_name
    FileUtils.mkdir_p(directory) unless File.directory?(directory)

    File.open(directory.join(filename), 'wb') do |new_file|
      new_file.write(file.read)
    end
  end

  def delete_image_file
    msg = "  DELETED image file #{filename} (#{original_filename})"
    File.delete ROOT_DIR.join(imageable_folder_name, filename)
    Rails.logger.info "\e[31m#{msg}\e[0m"
  end

  def imageable_folder_name
    return 'sole' unless respond_to?(:imageable)
    imageable.class.model_name.route_key
  end

  def file_format_validation
    return if file.blank? || file.try(:content_type).blank? || file.content_type =~ /image\/.+/
    errors.add(:file, :invalid_format)
  end
end
