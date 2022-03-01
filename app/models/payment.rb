class Payment < ApplicationRecord
  # relation
  has_many :shop_payments, dependent: :destroy
  # has_many :payments, through: :shop_payments, dependent: :destroy
end
