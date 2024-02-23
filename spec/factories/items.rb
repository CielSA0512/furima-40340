FactoryBot.define do
  factory :item do
    item_name         { Faker::Lorem.sentence }
    item_content      { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 1, to: 10) }
    status_id         { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id{ Faker::Number.between(from: 1, to: 2) }
    prefecture_id     { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id   { Faker::Number.between(from: 1, to: 3) }
    price             { Faker::Commerce.price(range: 300..9_999_999).to_i }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
