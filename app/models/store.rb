class Store
  attr_reader :store_id, :name, :city, :distance, :phone, :type

  def initialize(store_data)
    @store_id = store_data[:storeId]
    @name = store_data[:longName]
    @city = store_data[:city]
    @distance = store_data[:distance]
    @phone = store_data[:phone]
    @type = store_data[:storeType]
  end
end
