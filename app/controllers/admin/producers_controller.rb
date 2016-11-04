class Admin::ProducersController < AdminController
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

    if @producer.load_image && @producer.save
      redirect_to [:admin, @producer], notice: I18n.t('.admin.producers.create.success')
    else
      render :new
    end
  end

  def update
    @producer.assign_attributes producer_params

    if @producer.load_image && @producer.save
      redirect_to [:admin, @producer], notice: I18n.t('.admin.producers.update.success')
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
      params.require(:producer).permit(:name, :slug, :image, :web_site, :description)
    end
end
