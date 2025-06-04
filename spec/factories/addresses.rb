FactoryBot.define do
  factory :address do
    post_code { "MyString" }
    shipped_from_id { 1 }
    city { "MyString" }
    house_number { "MyString" }
    building_name { "MyString" }
    telephone_number { "MyString" }
    order { nil }
  end
end
