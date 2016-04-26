class SearchController < ApplicationController

  def index
    # @items = BestBuy.new(params[:search])
    @items = BestBuy.search(params[:search])
    binding.pry
  end
end
