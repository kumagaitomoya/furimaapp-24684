FactoryBot.define do
  factory :user_product do
    postal_code { '123-4567' }
    municipality { '横浜市' }
    address { '青山1-1' }
    buiding_name { '東京ハイツ' }
    phone_namber { '09053899435' }
    shipping_area_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
