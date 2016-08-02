require 'rails_helper'

RSpec.describe Store, type: :model do

  it "responds to the correct attributes" do

    store_params = { store_id: 100,
                     name: "Best Buy Mobile - Cherry Creek Shopping Center",
                     city: "Denver",
                     distance: "3.25",
                     phone: "303-270-9189",
                     type: "Mobile"
                   }

    store = Store.new(store_params)


    expect(store).to respond_to(:store_id)
    expect(store).to respond_to(:name)
    expect(store).to respond_to(:city)
    expect(store).to respond_to(:distance)
    expect(store).to respond_to(:phone)
    expect(store).to respond_to(:type)
  end
end
