FactoryBot.define do
  factory :product do
    name                   { Faker::Name.name }
    status                 { 'テスト' }
    price                  { '1000' }
    # 　　　　　　　　　　　　　　{ Faker::Number.number(4)}
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

# | user                | references | null: false,foreign_key: true |
# | name                | string     | null: false                   |
# | status              | text       | null: false                   |
# | price               | integer    | null: false                   |
# | category_id         | integer    | null: false                   |
# | shipping_charges_id | integer    | null: false                   |
# | shipping_days_id    | integer    | null: false                   |
# | shipping_area_id    | integer    | null: false                   |
# | condition_id        | integer    | null: false                   |
