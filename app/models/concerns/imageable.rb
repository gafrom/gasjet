module Imageable
  ROOT_DIR = Rails.root.join('public', 'uploads', 'images')

  extend ActiveSupport::Concern

  included do
    attr_accessor :image_file

    before_save :load_image
  end

  def image_url
    "/uploads/images/#{folder}/#{image}"
  end

  private

  def load_image
    return true if image_file.blank?

    uploaded_io = image_file
    filename = uploaded_io.original_filename

    directory = ROOT_DIR.join folder
    FileUtils.mkdir_p(directory) unless File.directory?(directory)

    File.open(directory.join(filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    self.image = filename

    true
  end

  def folder
    self.class.name.downcase.pluralize
  end
end
