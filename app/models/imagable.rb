module Imagable
  ROOT_DIR = Rails.root.join('public', 'uploads', 'images')

  def image_url
    "/uploads/images/#{folder}/#{image}"
  end

  def load_image
    return true if image.nil?

    uploaded_io = image_before_type_cast
    filename = uploaded_io.original_filename

    directory = ROOT_DIR.join folder
    FileUtils.mkdir_p(directory) unless File.directory?(directory)

    File.open(directory.join(filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    self.image = filename

    true
  rescue
    msg = 'load error'
    self.errors[:image] << msg

    false
  end

  private

  def folder
    self.class.name.downcase.pluralize
  end
end
