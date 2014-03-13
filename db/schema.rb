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

ActiveRecord::Schema.define(version: 20140313000619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: true do |t|
    t.string   "entry_date"
    t.string   "brand"
    t.string   "model"
    t.string   "bike_type"
    t.string   "color"
    t.string   "frame_size"
    t.string   "serial_number"
    t.text     "notes"
    t.text     "tag_info"
    t.string   "completion_date"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "seat_tube_size"
    t.float    "top_tube_size"
    t.integer  "log_number"
    t.text     "purpose"
    t.text     "mechanic"
  end

  create_table "volunteers", force: true do |t|
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
