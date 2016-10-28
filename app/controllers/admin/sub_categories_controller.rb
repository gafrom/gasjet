class Admin::SubCategoriesController < AdminController
  before_action :set_admin_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/sub_categories
  def index
    @admin_sub_categories = SubCategory.all
  end

  # GET /admin/sub_categories/1
  def show
  end

  # GET /admin/sub_categories/new
  def new
    @admin_sub_category = SubCategory.new
  end

  # GET /admin/sub_categories/1/edit
  def edit
  end

  # POST /admin/sub_categories
  def create
    @admin_sub_category = SubCategory.new(admin_sub_category_params)

    if @admin_sub_category.save
      redirect_to admin_sub_category_path(@admin_sub_category), notice: 'Sub category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sub_categories/1
  def update
    if @admin_sub_category.update(admin_sub_category_params)
      redirect_to admin_sub_category_path(@admin_sub_category), notice: 'Sub category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/sub_categories/1
  def destroy
    @admin_sub_category.destroy
  
    redirect_to admin_sub_categories_path, notice: 'Sub category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_sub_category
      @admin_sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_sub_category_params
      params.require(:sub_category).permit(:name, :slug, :category_id)
    end
end
