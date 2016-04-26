class BestBuy

  def initialize(search_term)
    @results = BestBuyService.new.connection(search_term).get
  end

end
