class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :shipped_from_id, :city, :house_number, :building_name,
                :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as 3 digits hyphen 4 digits (e.g. 123-4567)' }
    validates :shipped_from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Enter 10 or 11 digits without hyphens" }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code,
      shipped_from_id: shipped_from_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order.id
    )
  end

end
