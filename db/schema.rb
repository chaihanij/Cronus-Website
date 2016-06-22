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

ActiveRecord::Schema.define(version: 20160622043803) do

  create_table "announcements", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.text     "body",               limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "email",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "is_public",          limit: 1
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "company",    limit: 255
    t.string   "subject",    limit: 255
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "description",           limit: 255
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.boolean  "is_public",             limit: 1
    t.integer  "product_id",            limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "parent_id",             limit: 4
    t.integer  "lft",                   limit: 4,               null: false
    t.integer  "rgt",                   limit: 4,               null: false
    t.integer  "depth",                 limit: 4,   default: 0, null: false
    t.integer  "children_count",        limit: 4,   default: 0, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.text     "body",               limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "email",              limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_public",          limit: 1
  end

  create_table "images", force: :cascade do |t|
    t.string   "title",                  limit: 255
    t.string   "alt",                    limit: 255
    t.string   "imageFile_file_name",    limit: 255, null: false
    t.string   "imageFile_content_type", limit: 255, null: false
    t.integer  "imageFile_file_size",    limit: 4,   null: false
    t.datetime "imageFile_updated_at",               null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 255
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 255
    t.string   "action_name",         limit: 255
    t.string   "view_name",           limit: 255
    t.string   "request_hash",        limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "session_hash",        limit: 255
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "version",     limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_public",   limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "package_files", force: :cascade do |t|
    t.string   "package_file_name",    limit: 255
    t.string   "package_content_type", limit: 255
    t.integer  "package_file_size",    limit: 4
    t.datetime "package_updated_at"
    t.date     "build_date"
    t.date     "release_date"
    t.integer  "version_id",           limit: 4
    t.integer  "operating_system_id",  limit: 4
    t.boolean  "is_public",            limit: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "product_id",           limit: 4
    t.string   "package_fingerprint",  limit: 255
    t.string   "checksum",             limit: 255
    t.string   "slug",                 limit: 255
    t.text     "description",          limit: 65535
    t.boolean  "emergency_package",    limit: 1
  end

  add_index "package_files", ["operating_system_id"], name: "index_package_files_on_operating_system_id", using: :btree
  add_index "package_files", ["version_id"], name: "index_package_files_on_version_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.integer  "product_id",                limit: 4
    t.integer  "operating_system_id",       limit: 4
    t.string   "name",                      limit: 255
    t.string   "version",                   limit: 255
    t.string   "package_file_name",         limit: 255
    t.string   "package_content_type",      limit: 255
    t.integer  "package_file_size",         limit: 4
    t.datetime "package_updated_at"
    t.string   "release_note_file_name",    limit: 255
    t.string   "release_note_content_type", limit: 255
    t.integer  "release_note_file_size",    limit: 4
    t.datetime "release_note_updated_at"
    t.boolean  "release_package",           limit: 1
    t.boolean  "emergency_package",         limit: 1
    t.boolean  "notwork_package",           limit: 1
    t.boolean  "is_public",                 limit: 1
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "checksum",                  limit: 255
    t.date     "release_date"
    t.date     "build_date"
    t.text     "description",               limit: 65535
    t.string   "package_fingerprint",       limit: 255
    t.string   "slug",                      limit: 255
    t.boolean  "latest",                    limit: 1
  end

  add_index "packages", ["operating_system_id"], name: "index_packages_on_operating_system_id", using: :btree
  add_index "packages", ["product_id"], name: "index_packages_on_product_id", using: :btree
  add_index "packages", ["slug"], name: "index_packages_on_slug", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "public",      limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug",        limit: 255
  end

  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

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
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.text     "description",               limit: 65535
    t.boolean  "is_public",                 limit: 1
    t.integer  "product_id",                limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "latest",                    limit: 1
    t.string   "slug",                      limit: 255
    t.boolean  "release_version",           limit: 1
    t.boolean  "emergency_version",         limit: 1
    t.boolean  "broken_version",            limit: 1
    t.string   "release_note_file_name",    limit: 255
    t.string   "release_note_content_type", limit: 255
    t.integer  "release_note_file_size",    limit: 4
    t.datetime "release_note_updated_at"
    t.string   "release_note_fingerprint",  limit: 255
  end

  add_index "versions", ["product_id"], name: "index_versions_on_product_id", using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "body",           limit: 4294967295
    t.text     "sidebody",       limit: 65535
    t.integer  "parent_id",      limit: 4
    t.integer  "lft",            limit: 4,                      null: false
    t.integer  "rgt",            limit: 4,                      null: false
    t.integer  "depth",          limit: 4,          default: 0, null: false
    t.integer  "children_count", limit: 4,          default: 0, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "description",    limit: 255
    t.boolean  "is_public",      limit: 1
  end

  add_index "wikis", ["description"], name: "index_wikis_on_description", using: :btree
  add_index "wikis", ["lft"], name: "index_wikis_on_lft", using: :btree
  add_index "wikis", ["parent_id"], name: "index_wikis_on_parent_id", using: :btree
  add_index "wikis", ["rgt"], name: "index_wikis_on_rgt", using: :btree
  add_index "wikis", ["title"], name: "index_wikis_on_title", using: :btree

  add_foreign_key "package_files", "operating_systems"
  add_foreign_key "package_files", "versions"
  add_foreign_key "packages", "operating_systems"
  add_foreign_key "packages", "products"
  add_foreign_key "versions", "products"
end
