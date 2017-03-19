class Admin::ImagesController < AdminController
  before_action :set_image

  def destroy
    @image.destroy
    redirect_to [:admin, @image.imageable]
  end

  private def set_image
    @image = Image.find params[:id]
  end
end
