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

ActiveRecord::Schema.define(version: 20170210102951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "system_name"
    t.string   "title"
    t.boolean  "visible",          default: false
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.text     "content"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "articles", ["product_id"], name: "index_articles_on_product_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "system_name"
    t.text     "description"
    t.boolean  "visible",     default: true
    t.integer  "position",    default: 100
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "contact_type"
    t.string   "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "option"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "manuals", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "manual_type"
    t.string   "url"
    t.boolean  "visible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "manuals", ["product_id"], name: "index_manuals_on_product_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "system_name"
    t.string   "title"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "product_prices", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sheet_id"
    t.integer  "extend_count"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "product_prices", ["product_id"], name: "index_product_prices_on_product_id", using: :btree
  add_index "product_prices", ["sheet_id"], name: "index_product_prices_on_sheet_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "system_name"
    t.string   "brand_type"
    t.integer  "price"
    t.string   "image"
    t.string   "image_2"
    t.float    "width"
    t.float    "height"
    t.string   "length"
    t.text     "small_desc"
    t.text     "desc"
    t.float    "base_length"
    t.float    "base_weight"
    t.integer  "base_price"
    t.integer  "base_cost"
    t.integer  "base_install"
    t.integer  "base_sheet"
    t.float    "extend_length"
    t.float    "extend_weight"
    t.integer  "extend_price"
    t.integer  "extend_cost"
    t.integer  "extend_install"
    t.integer  "extend_sheet"
    t.integer  "position"
    t.float    "div_weight"
    t.integer  "div_price"
    t.integer  "div_cost"
    t.integer  "min_sheet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "add_desc"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.string   "product_type"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "sheets", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "price"
    t.integer  "cost"
    t.text     "description"
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "system_name"
    t.string   "link"
  end

  add_foreign_key "articles", "products"
  add_foreign_key "manuals", "products"
  add_foreign_key "product_prices", "products"
  add_foreign_key "product_prices", "sheets"
  add_foreign_key "products", "categories"
end
