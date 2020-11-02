FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    # email                 {"kkk@gmail.com"}
    # password              {"00000000"}
    # password_confirmation {password}
    # last_name
    # first_name
    # last_name_kana
    # first_name_kana
    # birthday
  end
end
