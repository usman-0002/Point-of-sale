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

ActiveRecord::Schema.define(version: 2022_06_04_152945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "job_title", default: ""
    t.date "joined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sales_units", force: :cascade do |t|
    t.integer "order_availability", default: 0, null: false
    t.integer "quantity", default: 0, null: false
    t.money "unit_price", scale: 2, default: "0.0", null: false
    t.bigint "product_id", null: false
    t.bigint "sales_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_sales_units_on_product_id"
    t.index ["sales_unit_id"], name: "index_product_sales_units_on_sales_unit_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "code", null: false
    t.string "name", default: "", null: false
    t.text "description", default: ""
    t.integer "quantity", default: 0
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["code"], name: "code_gin_index_on_products", opclass: :gin_trgm_ops, using: :gin
    t.index ["name"], name: "name_gin_index_on_products", opclass: :gin_trgm_ops, using: :gin
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "sales_units", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "abbreviation", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name", default: ""
    t.string "office_number", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: ""
    t.string "mobile_number", default: ""
    t.string "address", default: ""
    t.string "city", default: ""
    t.string "detailable_type"
    t.bigint "detailable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detailable_type", "detailable_id"], name: "index_user_details_on_detailable_type_and_detailable_id"
    t.index ["first_name"], name: "first_name_gin_index_on_user_details", opclass: :gin_trgm_ops, using: :gin
    t.index ["last_name"], name: "last_name_gin_index_on_user_details", opclass: :gin_trgm_ops, using: :gin
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "product_sales_units", "products"
  add_foreign_key "product_sales_units", "sales_units"
  add_foreign_key "products", "suppliers"
end
