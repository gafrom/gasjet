class PriceListsController < ApplicationController
  def show
    @price_list = PriceList.new

    send_data @price_list.data, filename: @price_list.filename
  end
end
