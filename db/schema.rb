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

ActiveRecord::Schema.define(version: 20150702031918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "categories", ["lft"], name: "index_categories_on_lft", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["rgt"], name: "index_categories_on_rgt", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "subject"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "documnet_file_name"
    t.string   "documnet_content_type"
    t.integer  "documnet_file_size"
    t.datetime "documnet_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "alt"
    t.string   "imageFile_file_name",    null: false
    t.string   "imageFile_content_type", null: false
    t.integer  "imageFile_file_size",    null: false
    t.datetime "imageFile_updated_at",   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.boolean  "is_public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "operating_system_id"
    t.string   "name"
    t.string   "version"
    t.string   "package_file_name"
    t.string   "package_content_type"
    t.integer  "package_file_size"
    t.datetime "package_updated_at"
    t.string   "release_note_file_name"
    t.string   "release_note_content_type"
    t.integer  "release_note_file_size"
    t.datetime "release_note_updated_at"
    t.boolean  "release_package"
    t.boolean  "emergency_package"
    t.boolean  "notwork_package"
    t.boolean  "is_public"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "checksum"
    t.date     "release_date"
    t.date     "build_date"
    t.text     "description"
  end

  add_index "packages", ["operating_system_id"], name: "index_packages_on_operating_system_id", using: :btree
  add_index "packages", ["product_id"], name: "index_packages_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "public"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "sidebody"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "description"
  end

  add_index "wikis", ["lft"], name: "index_wikis_on_lft", using: :btree
  add_index "wikis", ["parent_id"], name: "index_wikis_on_parent_id", using: :btree
  add_index "wikis", ["rgt"], name: "index_wikis_on_rgt", using: :btree

  add_foreign_key "packages", "operating_systems"
  add_foreign_key "packages", "products"
end
