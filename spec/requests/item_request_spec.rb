RSpec.describe "item record endpoint" do

  context "retrieve item information" do

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

      item1_data = JSON.parse(response.body, symbolize_names: :true )

      expect(response).to be_success

      expect(item1_data.length).to eq(3)
      expect(item1_data[:name]).to eq(item1.name)
      expect(item1_data[:description]).to eq(item1.description)
      expect(item1_data[:image_url]).to eq(item1.image_url)
    end
  end

  context "alter item data" do

    let!(:item1) { create(:item) }
    let!(:item2) { create(:item) }

    it "deletes an item" do
      expect(Item.where(id: item1.id, name: item1.name)).to exist
      
      delete "api/v1/items/1"

      expect(response.status).to eq(204)

      expect(Item.where(id: item1.id, name: item1.name)).to_not exist
    end

    it "creates an item" do
      new_item_params = { name: "Cubby Stuffers Subscription", 
                          description: "delicious", 
                          image_url: "http://placehold.it/350x150"
                        }

      post "api/v1/items", { item: new_item_params }

      expect(response.status).to eq(201)

      new_item = Item.last

      expect(new_item.name).to eq(new_item_params[:name])
      expect(new_item.description).to eq(new_item_params[:description])
      expect(new_item.image_url).to eq(new_item_params[:image_url])
    end
  end
end

