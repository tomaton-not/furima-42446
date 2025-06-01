class Item < ApplicationRecord
  belongs_to :user
  # has_one :order 商品購入機能の実装時に反映させる
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipped_from
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :delivery_time

  # 空では保存できない
  validates :item_name, :description, :category_id, :condition_id, :shipping_cost_id,
            :shipped_from_id, :delivery_time_id, :price, :image, presence: true

  # 「---」では保存できない（id:1）
  validates :category_id, :condition_id, :shipping_cost_id, :shipped_from_id, :delivery_time_id,
            numericality: { other_than: 1 }

  # 価格の範囲
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  def was_attached?
    image.attached?
  end
end
