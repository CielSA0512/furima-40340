FactoryBot.define do
  factory :item do
    item_name         {Faker::Lorem.sentence}
    item_content      {Faker::Lorem.sentence}
    category          {Category.all.sample}
    status            {Status.all.sample}
    delivery_charge   {DeliveryCharge.all.sample}
    prefecture        {Prefecture.all.sample}
    shipping_day      {ShippingDay.all.sample}
    price             {Faker::Commerce.price(range: 300..9999999).to_i}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
