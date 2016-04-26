class SearchController < ApplicationController

  def index
    # @items = BestBuy.new(params[:search])
    @items = BestBuyService.
  end
end
