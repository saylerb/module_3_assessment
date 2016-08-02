RSpec.describe "item record endpoint" do
  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }

  it "returns the information for all items" do
    get "/api/v1/items"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    item1_data, item2_data = data.first, data.last

    expect(item1_data.length).to eq(3)
    expect(item1_data[:name]).to eq(item1.name)
    expect(item1_data[:description]).to eq(item1.description)
    expect(item1_data[:image_url]).to eq(item1.image_url)

    expect(item2_data.length).to eq(3)
    expect(item2_data[:name]).to eq(item2.name)
    expect(item2_data[:description]).to eq(item2.description)
    expect(item2_data[:image_url]).to eq(item2.image_url)
  end

  it "returns the information for a single item" do
    get "api/v1/items/1"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
  end
end

