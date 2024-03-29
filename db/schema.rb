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

ActiveRecord::Schema.define(version: 20160109014138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "favs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "residence_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "favs", ["residence_id"], name: "index_favs_on_residence_id", using: :btree
  add_index "favs", ["user_id"], name: "index_favs_on_user_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "picture"
    t.integer  "residence_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "residence_id"
    t.string   "comment"
    t.integer  "value",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "residence_features", force: :cascade do |t|
    t.integer  "feature_id"
    t.integer  "residence_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "residences", force: :cascade do |t|
    t.string   "name"
    t.string   "address",                                     null: false
    t.decimal  "price",         precision: 7,                 null: false
    t.integer  "square_meters"
    t.text     "description"
    t.integer  "rooms"
    t.integer  "user_id"
    t.boolean  "archived",                    default: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "city_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "residences", ["latitude"], name: "index_residences_on_latitude", using: :btree
  add_index "residences", ["longitude"], name: "index_residences_on_longitude", using: :btree
  add_index "residences", ["user_id"], name: "index_residences_on_user_id", using: :btree

  create_table "search_points", force: :cascade do |t|
    t.string   "input",                  null: false
    t.integer  "hits",       default: 0
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "search_points", ["latitude"], name: "index_search_points_on_latitude", using: :btree
  add_index "search_points", ["longitude"], name: "index_search_points_on_longitude", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "search_term", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "universities", ["latitude"], name: "index_universities_on_latitude", using: :btree
  add_index "universities", ["longitude"], name: "index_universities_on_longitude", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.boolean  "owner_enabled",          default: false
    t.integer  "university_id"
    t.integer  "semester"
    t.string   "avatar"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "favs", "residences"
  add_foreign_key "favs", "users"
  add_foreign_key "residences", "users"
end
