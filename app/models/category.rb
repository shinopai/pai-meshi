class Category < ApplicationRecord
  # relation
  has_many :shop_categories, dependent: :destroy
  # has_many :shops, through: :shop_categories, dependent: :destroy
end
