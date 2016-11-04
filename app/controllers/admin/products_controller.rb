class Admin::ProductsController < ApplicationController
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

    if @product.load_image && @product.save
      redirect_to [:admin, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    @product.assign_attributes product_params

    if @product.load_image && @product.save
      redirect_to [:admin, @product], notice: 'Product was successfully updated.'
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
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product)
            .permit(:name, :slug, :description, :weight, :product_type,
                    :category_id, :producer_id, :image)
    end
end
