class Admin::ProductsController < AdminController
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
      redirect_to [:admin, @resource], notice: I18n.t('.admin.products.create.success')
    else
      render :new
    end
  end

  def update
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to [:admin, @resource], notice: I18n.t('.admin.products.update.success')
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy

    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def build_image
      @resource.images.build
      @resource.images.build
      @resource.images.build
    end

    def set_resource
      @resource ||= params[:slug] ? base.find_by!(slug: params[:slug]) : base.new
    end

    def resource_params
      params.require(:product)
            .permit(:name, :slug, :description, :weight, :product_type,
                    :category_id, :producer_id, images_attributes: [:file])
    end

    def base
      ::Product
    end
end
