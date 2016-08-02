FactoryGirl.define do

  sequence(:item_name) { |n| "Item Name #{n}" }
  sequence(:description) { |n| "Description #{n}" }

  factory :item do
    name { generate(:item_name) }
    description { generate(:description) }
    image_url "http://placehold.it/350x150"
  end
end
