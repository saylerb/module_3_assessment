FactoryGirl.define do

  sequence(:name) { |n| "Item Name #{n}" }
  sequence(:description) { |n| "Description #{n}" }

  factory :item do
    name { generate(:name) }
    description { generate(:description) }
    image_url "http://placehold.it/350x150"
  end
end
