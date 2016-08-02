require 'rails_helper'

RSpec.describe "store search" do
  it "searches by zip code" do
    visit root_path 

    fill_in :search_query, with: "80202"

    click_on "Search"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("17 Total Stores")

    within "#store-2740" do
      expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("3.25")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile")
    end
  end
end
