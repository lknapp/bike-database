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

ActiveRecord::Schema.define(version: 20151230021120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "agency_name",    limit: 255
    t.string "contact_name",   limit: 255
    t.string "street_address", limit: 255
    t.string "city",           limit: 255
    t.string "state",          limit: 255
    t.string "postal_code",    limit: 255
    t.string "phone_number",   limit: 255
    t.string "email",          limit: 255
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "entry_date",     limit: 255
    t.string   "brand",          limit: 255
    t.string   "model",          limit: 255
    t.string   "bike_type",      limit: 255
    t.string   "color",          limit: 255
    t.string   "serial_number",  limit: 255
    t.text     "work_done"
    t.text     "new_parts"
    t.string   "price",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "seat_tube_size"
    t.float    "top_tube_size"
    t.integer  "log_number"
    t.text     "purpose"
    t.text     "mechanic"
    t.date     "date_sold"
    t.integer  "bike_index_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",           limit: 255
    t.string   "last_name",            limit: 255
    t.date     "application_date_bkp"
    t.string   "gender",               limit: 255
    t.integer  "age"
    t.boolean  "helmet"
    t.boolean  "lock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bike_id"
    t.string   "bike_type_requested",  limit: 255
    t.boolean  "will_pay"
    t.integer  "agency_id"
    t.text     "notes"
    t.boolean  "bike_fixed"
    t.integer  "number_of_calls"
    t.boolean  "application_voided"
    t.date     "pickup_date_bkp"
    t.string   "volunteer_at_pickup",  limit: 255
    t.float    "weight"
    t.float    "height"
    t.datetime "application_date"
    t.datetime "pickup_date"
  end

  add_index "clients", ["agency_id"], name: "index_clients_on_agency_id", using: :btree
  add_index "clients", ["bike_id"], name: "index_clients_on_bike_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string  "name",                    limit: 255
    t.string  "email",                   limit: 255
    t.string  "phone",                   limit: 255
    t.date    "orientation_date"
    t.integer "other_volunteer_hours"
    t.text    "referral"
    t.text    "reason"
    t.text    "skills"
    t.text    "wants"
    t.boolean "interested_in_improving"
    t.boolean "available_weekends"
    t.boolean "available_weekdays"
    t.boolean "available_shorter_hours"
    t.boolean "available_longer_hours"
    t.boolean "flexible"
    t.text    "questions"
    t.text    "improve_orientation"
  end

end
