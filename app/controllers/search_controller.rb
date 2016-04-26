class SearchController < ApplicationController

  def index
    @items = BestBuy.new  
  end
end
