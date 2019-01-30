class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 6, scale: 2
      t.integer :order_items_count, null: false, default: 0

      t.timestamps
    end
  end
end
