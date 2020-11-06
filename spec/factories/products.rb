FactoryBot.define do
  factory :product do
    name                   { Faker::Name.name }
    status                 { 'テスト' }
    price                  { '1000' }
    category_id            { '2' }
    shipping_charges_id    { '2' }
    shipping_days_id       { '2' }
    shipping_area_id       { '2' }
    condition_id           { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
