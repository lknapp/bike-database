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

ActiveRecord::Schema.define(version: 20151219225720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "agency_name"
    t.string "contact_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "phone_number"
    t.string "email"
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "entry_date"
    t.string   "brand"
    t.string   "model"
    t.string   "bike_type"
    t.string   "color"
    t.string   "serial_number"
    t.text     "work_done"
    t.text     "new_parts"
    t.string   "price"
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
    t.string   "first_name"
    t.string   "last_name"
    t.date     "application_date_bkp"
    t.string   "gender"
    t.integer  "age"
    t.boolean  "helmet"
    t.boolean  "lock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bike_id"
    t.string   "bike_type_requested"
    t.boolean  "will_pay"
    t.integer  "agency_id"
    t.text     "notes"
    t.boolean  "bike_fixed"
    t.integer  "number_of_calls"
    t.boolean  "application_voided"
    t.date     "pickup_date"
    t.string   "volunteer_at_pickup"
    t.float    "weight"
    t.float    "height"
    t.datetime "application_date"
  end

  add_index "clients", ["agency_id"], name: "index_clients_on_agency_id", using: :btree
  add_index "clients", ["bike_id"], name: "index_clients_on_bike_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "phone"
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
