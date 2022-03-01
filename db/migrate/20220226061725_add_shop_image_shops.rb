class AddShopImageShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :shop_image, :string, null: false,  after: :address
  end
end
