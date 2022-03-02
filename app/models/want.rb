class Want < ApplicationRecord
  # relation
  belongs_to :user

  # validation
  validates :shop_name, :address,
            presence: true
  validates :shop_name,
            length: { maximum: 50 }
  validates :address,
            format: { with: /.*[都道府県]/ }
end
