class Admin::CategoriesController < AdminController
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
      redirect_to admin_category_path(@resource), notice: I18n.t('.admin.categories.create.success')
    else
      render :new
    end
  end

  def update
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to admin_category_path(@resource), notice: I18n.t('admin.categories.update.success')
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy

    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
  end

  private
    def build_image
      @resource.images.any? || @resource.images.build
    end

    def set_resource
      @resource ||= params[:id] ? base.find(params[:id]) : base.new
    end

    def resource_params
      params.require(:category).permit(:name, :slug, :category_id, :subtitle, images_attributes: [:file])
    end

    def base
      ::Category
    end
end
