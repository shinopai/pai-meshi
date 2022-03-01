class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :price, null: false
      t.integer :score, null: false
      t.text :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :shop_id], unique: :true
  end
end
