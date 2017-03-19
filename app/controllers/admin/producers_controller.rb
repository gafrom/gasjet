class Admin::ProducersController < AdminController
  before_action :set_resource, except: :index
  before_action :build_image, only: [:new, :edit]

  def index
    @resources = base.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to [:admin, @resource], notice: I18n.t('.admin.producers.create.success')
    else
      render :new
    end
  end

  def update
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to [:admin, @resource], notice: I18n.t('.admin.producers.update.success')
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy

    redirect_to producers_url, notice: 'Producer was successfully destroyed.'
  end

  private
    def build_image
      @resource.images.any? || @resource.images.build
    end

    def set_resource
      @resource ||= params[:id] ? base.find(params[:id]) : base.new
    end

    def base
      ::Producer
    end

    def resource_params
      params.require(:producer).permit(:name, :slug, :web_site, :description, images_attributes: [:file])
    end
end
