require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item) { build(:item) }

  it "has a valid factory" do
    expect(item).to be_valid
  end

  it "responds to the correct attributes" do
    expect(item).to respond_to(:name)
    expect(item).to respond_to(:description)
    expect(item).to respond_to(:image_url)
    expect(item).to respond_to(:created_at)
    expect(item).to respond_to(:updated_at)
  end
end
