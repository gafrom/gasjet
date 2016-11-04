module Imagable
  def image_url
    "storage/images/#{self.class.name.downcase.pluralize}/#{image}"
  end
end
