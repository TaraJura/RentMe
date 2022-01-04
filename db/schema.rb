
ActiveRecord::Schema.define(version: 2022_01_04_112030) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "noteable_type", null: false
    t.integer "noteable_id", null: false
    t.integer "user_id", null: false
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "rental_periods", force: :cascade do |t|
    t.date "from"
    t.date "to"
    t.date "returned_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_from_id"
    t.integer "user_to_id"
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_rental_periods_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "items", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "rental_periods", "items"
end
