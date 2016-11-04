class Admin::ProducersController < ApplicationController
  before_action :set_producer, only: [:show, :edit, :update, :destroy]

  def index
    @producers = Producer.all
  end

  def show
  end

  def new
    @producer = Producer.new
  end

  def edit
  end

  def create
    @producer = Producer.new(producer_params)

    if @producer.save
      redirect_to [:admin, @producer], notice: 'Producer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @producer.update(producer_params)
      redirect_to [:admin, @producer], notice: 'Producer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @producer.destroy

    redirect_to producers_url, notice: 'Producer was successfully destroyed.'
  end

  private
    def set_producer
      @producer = Producer.find(params[:id])
    end

    def producer_params
      params.require(:producer).permit(:name, :slug, :image, :website, :description)
    end
end
