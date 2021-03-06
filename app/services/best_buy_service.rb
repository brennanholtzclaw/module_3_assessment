class BestBuyService
# http://api.bestbuy.com/v1/products(longDescription=sennheiser*)?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&apiKey=tq72hpvtbbd4mue6f23kmsw2&format=json
  def initialize(search_term)
    @_connection = Faraday.new("https://api.bestbuy.com/v1/products(longDescription=#{search_term}*)")
    connection.params["apiKey"] = ENV["BEST_BUY_KEY"]
    connection.params["show"] = "sku,name,customerReviewAverage,shortDescription,salePrice,image"
    connection.params["pageSize"] = "15"
    connection.params["format"] = "json"
  end

  def results
    connection.get
  end

  def connection
    @_connection
  end
end
