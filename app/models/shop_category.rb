class ShopCategory < ApplicationRecord
  # relation
  belongs_to :shop
  belongs_to :category

  # validation
  validates :shop_id, uniqueness: { scope: :category_id}
end
