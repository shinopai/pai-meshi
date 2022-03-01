class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :address, null: false
      t.integer :parking, default: 0

      t.timestamps
    end
  end
end
