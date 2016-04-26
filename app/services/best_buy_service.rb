class BestBuyService

  def base_url
     "https://api.bestbuy.com/v1/products"
  end

  def api
    BEST_BUY_KEY
  end

  def connection
    Faraday.new("#{base_url}?apiKey=#{api}")
  end

end
