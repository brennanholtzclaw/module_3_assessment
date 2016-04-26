class BestBuyService
# http://api.bestbuy.com/v1/products(longDescription=sennheiser*)?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&apiKey=tq72hpvtbbd4mue6f23kmsw2&format=json
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com/v1/products")
    connection.params["apiKey"] = ENV["BEST_BUY_KEY"]
    connection.params["show"] = "sku,name,customerReviewAverage,shortDescription,salePrice,image"
    connection.params["pageSize"] = "15"
    connection.params["format"] = "json"
  end

  def base_url
     "https://api.bestbuy.com/v1/products"
  end

  def results(search_term)
    connection.get("(longDescription=#{search_term}*)", params)
    # (longDescription=#{search_term}*)
  end

  def connection
    @_connection
  end

end


# def initialize
#   @_connection = Faraday.new("http://congress.api.sunlightfoundation.com")
#   connection.params["apikey"] = ENV["SUNLIGHT_API"]
# end
#
# def legislators(params)
#   parse(connection.get("/legislators", params))[:results]
#   # JSON.parse(connection.get("/legislators", params).body, symbolize_names: true)[:results]
# end

# class MtgService
#   def connection
#     Faraday.new('https://api.magicthegathering.io')
#   end
#
#   def sets
#     JSON.parse(connection.get("/v1/sets?name=dragons_of_tarkir,origins,battle_for_zendikar,oath_of_the_gatewatch,shadows_over_innistrad&pageSize=10").body)["sets"]
#   end
#
#   def cards
#     JSON.parse(connection.get("/v1/cards?set=soi&pageSize=10").body)
#     # Card.where(set: "SOI").sample(10)
#   end
#
#   def get_set_cards(code)
#     JSON.parse(connection.get("/v1/cards?set=#{code.downcase}&pageSize=300").body)
#   end
# end
