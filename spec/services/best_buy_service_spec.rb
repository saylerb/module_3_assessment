require "rails_helper"

RSpec.describe BestBuyService do

  it "returns a list of stores" do
    VCR.use_cassette("best_buy_stores") do
      all_store_data = BestBuyService.new.get_store_data
      store = all_store_data[:stores].first

      expect(store[:storeId]).to eq(100)
    end
  end
end
