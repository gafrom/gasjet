class ProducersController < ApplicationController
  def show
    @producer = Producer.find_by(slug: params[:slug])
  end
end
