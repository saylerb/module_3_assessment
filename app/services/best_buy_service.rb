class BestBuyService
  def initialize
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def get_store_data(zip_code)
    response = connection.get do |req|
      req.url "/v1/stores(area(#{zip_code},25))"
      req.params['apiKey'] = ENV["BEST_BUY_API_KEY"]
      req.params['show'] = 'storeId,longName,city,distance,phone,storeType'
      req.params['format'] = 'json'
      req.params['pageSize'] = '15'
    end
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def connection
      @_connection
    end
end
