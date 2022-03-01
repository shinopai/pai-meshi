require 'http'

class Shop < ApplicationRecord
    class << self

    def search term
      HTTP.get('http://webservice.recruit.co.jp/hotpepper/gourmet/v1/', :params => { :key => ENV['API_KEY'], :name => term, :format => 'json' })
    end
  end

  def add_category category
    shops_categories << category
  end

  def delete_category category
    shops_categories.delete(category)
  end

  def has_category? category
    shops_categories.include?(category)
  end

  def add_payment payment
    shops_payments << payment
  end

  def delete_payment payment
    shops_payments.delete(payment)
  end

  def has_payment? payment
    shops_payments.include?(payment)
  end

  # carrierwave
  mount_uploader :shop_image, ShopImageUploader

  # relation
  has_many :shop_categories, dependent: :destroy
  has_many :shops_categories, through: :shop_categories, source: :category
  has_many :shop_payments, dependent: :destroy
  has_many :shops_payments, through: :shop_payments, source: :payment
  has_many :reviews, dependent: :destroy

  # validation
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:shop_image, "の拡張子が間違っています") unless shop_image.content_type.in?(extension)
  end

  validates :shop_name, :address, :shop_image,
            presence: true
  validates :shop_name,
            length: { maximum: 50 }
  validates :address,
            format: { with: /.*[都道府県]/ }
  # shop_image validation
  validate :image_content_type
end
