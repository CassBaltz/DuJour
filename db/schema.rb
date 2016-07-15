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

ActiveRecord::Schema.define(version: 20141210105132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: true do |t|
    t.string   "bio_photo_file_name"
    t.string   "bio_photo_content_type"
    t.integer  "bio_photo_file_size"
    t.datetime "bio_photo_updated_at"
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooking_tools", force: true do |t|
    t.string   "name"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "header_photos", force: true do |t|
    t.string   "name"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meal_id"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.decimal  "measurement_quantity"
    t.string   "measurement_type"
    t.integer  "order_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.text     "content"
    t.integer  "order_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meal_limits", force: true do |t|
    t.integer  "meal_id"
    t.integer  "store_id"
    t.integer  "availability"
    t.integer  "current_orders", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",         default: false
  end

  add_index "meal_limits", ["store_id", "meal_id"], name: "index_meal_limits_on_store_id_and_meal_id", unique: true, using: :btree
  add_index "meal_limits", ["store_id"], name: "index_meal_limits_on_store_id", using: :btree

  create_table "meal_photos", force: true do |t|
    t.string   "name"
    t.integer  "meal_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.integer  "chef_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_time"
    t.string   "prep_time"
    t.string   "cook_time"
  end

  create_table "order_options", force: true do |t|
    t.string   "size"
    t.string   "feeds"
    t.decimal  "price"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.integer  "order_option_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripeToken"
    t.string   "state"
    t.boolean  "ready_for_pickup", default: false
  end

  create_table "relationships", force: true do |t|
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["store_id"], name: "index_relationships_on_store_id", using: :btree
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.integer  "chef_id"
    t.string   "city"
    t.string   "state"
    t.string   "restaurant_picture_file_name"
    t.string   "restaurant_picture_content_type"
    t.integer  "restaurant_picture_file_size"
    t.datetime "restaurant_picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "stores", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "street"
    t.string   "street_alt"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "zip"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                     default: false
    t.string   "password_recovery_token"
    t.datetime "password_recovery_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["zip"], name: "index_users_on_zip", using: :btree

end
