# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150703001104) do

  create_table "clients", force: :cascade do |t|
    t.integer  "profile_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "clients", ["profile_id"], name: "index_clients_on_profile_id", using: :btree

  create_table "inventory_items", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "party_id",         limit: 4
    t.integer  "amount_purchased", limit: 4
    t.decimal  "unit_cost",                  precision: 5, scale: 2
    t.decimal  "total_cost",                 precision: 5, scale: 2
    t.decimal  "profit_margin",              precision: 5, scale: 2
    t.decimal  "amount_sold",                precision: 5, scale: 2, default: 0.0
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "msrp",                       precision: 5, scale: 2
  end

  add_index "inventory_items", ["party_id"], name: "index_inventory_items_on_party_id", using: :btree
  add_index "inventory_items", ["product_id"], name: "index_inventory_items_on_product_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "party_date"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.decimal  "ticket_value",             precision: 5, scale: 2, default: 0.0
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.decimal  "price",                     precision: 5, scale: 2
    t.text     "description", limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "cpf",          limit: 255
    t.string   "rg",           limit: 255
    t.string   "telephone",    limit: 255
    t.string   "cell_phone",   limit: 255
    t.string   "email",        limit: 255
    t.decimal  "credits",                  precision: 5, scale: 2, default: 0.0
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "profile_type", limit: 4
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree
  add_index "sales", ["product_id"], name: "index_sales_on_product_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "employee_id",   limit: 4
    t.integer  "customer_id",   limit: 4
    t.integer  "party_id",      limit: 4
    t.decimal  "quantity",                  precision: 5, scale: 2
    t.decimal  "value",                     precision: 5, scale: 2
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "product_id",    limit: 4
    t.string   "product_name",  limit: 255
    t.decimal  "product_price",             precision: 5, scale: 2
  end

  add_index "transactions", ["customer_id"], name: "index_transactions_on_customer_id", using: :btree
  add_index "transactions", ["employee_id"], name: "index_transactions_on_employee_id", using: :btree
  add_index "transactions", ["party_id"], name: "index_transactions_on_party_id", using: :btree
  add_index "transactions", ["product_id"], name: "index_transactions_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id",             limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
