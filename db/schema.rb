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

ActiveRecord::Schema.define(version: 20140809150942) do

  create_table "comments", force: true do |t|
    t.text     "post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ride_id"
  end

  add_index "comments", ["ride_id"], name: "index_comments_on_ride_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "ratings", force: true do |t|
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ride_id"
  end

  add_index "ratings", ["ride_id"], name: "index_ratings_on_ride_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "rides", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "map"
    t.float    "distance"
    t.date     "date"
    t.time     "time"
    t.float    "avg_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "rides", ["user_id"], name: "index_rides_on_user_id"

  create_table "rides_users", id: false, force: true do |t|
    t.integer "ride_id"
    t.integer "user_id"
  end

  add_index "rides_users", ["ride_id", "user_id"], name: "index_rides_users_on_ride_id_and_user_id"
  add_index "rides_users", ["user_id"], name: "index_rides_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
