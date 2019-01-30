ActiveRecord::Schema.define(version: 20_190_126_101_509) do
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.decimal 'price', precision: 6, scale: 2
    t.integer 'order_items_count', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'shopping_cart_addresses', force: :cascade do |t|
    t.string 'firstname'
    t.string 'lastname'
    t.string 'address'
    t.string 'city'
    t.string 'zip'
    t.string 'phone'
    t.string 'type'
    t.bigint 'country_id'
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable'
    t.index ['country_id'], name: 'index_shopping_cart_addresses_on_country_id'
  end

  create_table 'shopping_cart_countries', force: :cascade do |t|
    t.string 'name'
    t.string 'phone_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_shopping_cart_countries_on_name', unique: true
    t.index ['phone_code'], name: 'index_shopping_cart_countries_on_phone_code', unique: true
  end

  create_table 'shopping_cart_coupons', force: :cascade do |t|
    t.string 'code'
    t.integer 'discount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'shopping_cart_credit_cards', force: :cascade do |t|
    t.string 'number'
    t.string 'card_owner'
    t.string 'expiry_date'
    t.bigint 'order_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_shopping_cart_credit_cards_on_order_id'
  end

  create_table 'shopping_cart_deliveries', force: :cascade do |t|
    t.string 'name'
    t.string 'terms'
    t.decimal 'price', precision: 6, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'shopping_cart_order_items', force: :cascade do |t|
    t.decimal 'price', precision: 8, scale: 2, default: '0.0', null: false
    t.integer 'quantity', default: 0, null: false
    t.decimal 'sub_total', precision: 8, scale: 2, default: '0.0', null: false
    t.bigint 'product_id'
    t.bigint 'order_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_shopping_cart_order_items_on_order_id'
    t.index ['product_id'], name: 'index_shopping_cart_order_items_on_product_id'
  end

  create_table 'shopping_cart_orders', force: :cascade do |t|
    t.string 'order_number'
    t.decimal 'total_price', precision: 10, scale: 2, default: '0.0', null: false
    t.integer 'status', default: 0, null: false
    t.bigint 'user_id'
    t.bigint 'delivery_id'
    t.bigint 'coupon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['coupon_id'], name: 'index_shopping_cart_orders_on_coupon_id'
    t.index ['delivery_id'], name: 'index_shopping_cart_orders_on_delivery_id'
    t.index ['order_number'], name: 'index_shopping_cart_orders_on_order_number', unique: true
    t.index ['user_id'], name: 'index_shopping_cart_orders_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
