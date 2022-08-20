class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :schedule_delivery
  belongs_to :shipping_fee_status

  with_options presence: true do
    validates :name, length: { minimum: 1, maxmum: 40 }
    validates :info, length: { minimum: 1, maxmum: 1000 }
    validates :price
    validates :sales_status_id
    validates :schedule_delivery_id
    validates :prefecture_id
    validates :category_id
    validates :shipping_fee_status_id
    validates :user
    validates :image
  end

  with_options numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 } do
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/, message: '半角数字で入力' }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :schedule_delivery_id
  end
end
