require "rails_helper"

RSpec.describe BestBuyService do

  it "returns a list of stores" do
    VCR.use_cassette("best_buy_stores") do
      all_store_data = BestBuyService.new.get_store_data("80202")

      stores = all_store_data[:stores]

      expect(stores.length).to eq(15)

      store = stores.first

      expect(store[:storeId]).to eq(2740)
      expect(store[:longName]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(store[:city]).to eq("Denver")
      expect(store[:distance]).to eq(3.25)
      expect(store[:phone]).to eq("303-270-9189")
      expect(store[:storeType]).to eq("Mobile")
    end
  end
end
