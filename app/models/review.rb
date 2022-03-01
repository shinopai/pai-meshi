class Review < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :shop

  # validation
  validates :price, :score, :comment,
            presence: true
  validates :price,
            numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :score,
            numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :comment,
            length: { maximum: 200 }
  validates :user_id, uniqueness: { scope: :shop_id}
end
