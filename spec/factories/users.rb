FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { 'Ab0508' }
    password_confirmation { 'Ab0508' }
    last_name             { '山田' }
    first_name            { '友弥' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1993-05-08' }
  end
end
