class CreateShoppingCartCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_cart_countries do |t|
      t.string :name, index: { unique: true }
      t.string :phone_code, index: { unique: true }

      t.timestamps
    end
  end
end
