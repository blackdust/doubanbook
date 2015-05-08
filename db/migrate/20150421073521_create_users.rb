class CreateUsers < ActiveRecord::Migration
  def change
    create_table "carts", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "title"
      t.integer  "price"
      t.integer  "quantity"
      t.integer  "user_id"
    end

    create_table "classifybooks", force: :cascade do |t|
      t.string   "condition"
      t.string   "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "orders", force: :cascade do |t|
      t.string   "information"
      t.integer  "total_price"
      t.string   "phonenumber"
      t.string   "address"
      t.integer  "user_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "products", force: :cascade do |t|
      t.string   "title"
      t.text     "description"
      t.decimal  "price"
      t.string   "subject"
      t.string   "image"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

    create_table "serchbooknames", force: :cascade do |t|
      t.string   "word"
      t.string   "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.string   "password"
      t.datetime "created_at",            null: false
      t.datetime "updated_at",            null: false
      t.string   "password_confirmation"
      t.string   "password_digest"
    end
  end
end
