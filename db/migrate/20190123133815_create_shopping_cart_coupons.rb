class CreateShoppingCartCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_cart_coupons do |t|
      t.string :code
      t.integer :discount

      t.timestamps
    end
  end
end
