FactoryBot.define do
  factory :order_address do
    post_code         { '123-4567' }
    shipped_from_id   { 2 }
    city              { '横浜市' }
    house_number      { '1-1' }
    building_name     { '青山ビル' }
    telephone_number  { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end
