RSpec.describe "item record endpoint" do
  let!(:item) { create(:item) }

  it "returns the information for all items" do
    get "/api/v1/items"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
  end
end

