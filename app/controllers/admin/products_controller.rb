class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new product_params

    if @product.save
      redirect_to [:admin, @product], notice: I18n.t('.admin.products.create.success')
    else
      render :new
    end
  end

  def update
    @product.assign_attributes product_params

    if @product.save
      redirect_to [:admin, @product], notice: I18n.t('.admin.products.update.success')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find_by!(slug: params[:slug])
    end

    def product_params
      params.require(:product)
            .permit(:name, :slug, :description, :weight, :product_type,
                    :category_id, :producer_id, :image_file)
    end
end
