class BestBuy

  def self.search(search_term)
    service = BestBuyService.new(search_term)
    JSON.parse(service.results.body)
    # service.results
  end
end
