class BestBuyService
# http://api.bestbuy.com/v1/products(longDescription=sennheiser*)?show=sku,name&pageSize=15&apiKey=tq72hpvtbbd4mue6f23kmsw2&format=json
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
