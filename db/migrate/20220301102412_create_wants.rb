class CreateWants < ActiveRecord::Migration[6.1]
  def change
    create_table :wants do |t|
      t.string :shop_name, null: false
      t.string :address, null: false
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
