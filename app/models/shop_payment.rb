class ShopPayment < ApplicationRecord
  # relation
  belongs_to :shop
  belongs_to :payment

  # validation
  validates :shop_id, uniqueness: { scope: :payment_id}
end
