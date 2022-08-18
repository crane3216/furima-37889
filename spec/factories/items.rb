FactoryBot.define do
  factory :item do
    association :user
    image                  { Faker::Lorem.sentence }
    price                  { 12_345 }
    name                   { 'ガンダム' }
    info                   { 'プラモデル' }
    category_id            { 2 }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    schedule_delivery_id   { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
