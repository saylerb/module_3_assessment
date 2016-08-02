class StoreSearch
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def self.all(query)
    new(query).all
  end

  def all
    stores = all_store_data[:stores].map do |store_data|
      Store.new(store_data)
    end
    total_stores = all_store_data[:total]

    [stores, total_stores]
  end

  def all_store_data
    service.get_store_data(query)
  end

  def service
    @service ||= BestBuyService.new
  end
end
