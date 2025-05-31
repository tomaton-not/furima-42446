FactoryBot.define do
  factory :item do
    item_name               { 'test' }
    description             { 'testtext' }
    category_id             { 2 }
    condition_id            { 2 }
    shipping_cost_id        { 2 }
    shipped_from_id         { 2 }
    delivery_time_id        { 2 }
    price                   { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end
  end
end
