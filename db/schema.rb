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

ActiveRecord::Schema.define(version: 20150426075723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hours", force: :cascade do |t|
    t.time     "mon_open"
    t.time     "tue_open"
    t.time     "wed_open"
    t.time     "thu_open"
    t.time     "fri_open"
    t.time     "sat_open"
    t.time     "sun_open"
    t.time     "mon_close"
    t.time     "tue_close"
    t.time     "wed_close"
    t.time     "thu_close"
    t.time     "fri_close"
    t.time     "sat_close"
    t.time     "sun_close"
    t.time     "mon_start"
    t.time     "tue_start"
    t.time     "wed_start"
    t.time     "thu_start"
    t.time     "fri_start"
    t.time     "sat_start"
    t.time     "sun_start"
    t.time     "mon_end"
    t.time     "tue_end"
    t.time     "wed_end"
    t.time     "thu_end"
    t.time     "fri_end"
    t.time     "sat_end"
    t.time     "sun_end"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hours", ["business_id"], name: "index_hours_on_business_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "photo"
    t.string   "caption"
    t.integer  "user_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "photos", ["business_id"], name: "index_photos_on_business_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "body"
    t.float    "rating"
    t.string   "title"
    t.integer  "user_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "hometown"
    t.string   "nickname"
    t.string   "headline"
    t.string   "website"
    t.string   "password_digest"
    t.string   "photo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "role"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_foreign_key "hours", "businesses"
  add_foreign_key "photos", "businesses"
  add_foreign_key "photos", "users"
  add_foreign_key "reviews", "businesses"
  add_foreign_key "reviews", "users"
end
