class CreateShopPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_payments do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
    add_index :shop_payments, [:shop_id, :payment_id], unique: :true
  end
end
