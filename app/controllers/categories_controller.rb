class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @category = Category.find_by(slug: params[:slug])
  end
end
