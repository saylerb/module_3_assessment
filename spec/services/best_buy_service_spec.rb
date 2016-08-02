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

  it "returns the hours for a single store" do
    VCR.use_cassette("best_buy_hours") do
      store_hours_data = BestBuyService.new.get_store_hours("2740")

      expect(store_hours_data[:stores].first[:hours]).to eq("Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6")
    end
  end
end
