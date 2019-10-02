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

ActiveRecord::Schema.define(version: 2019_10_02_191806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.string "abv"
    t.bigint "profiles_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profiles_id"], name: "index_genders_on_profiles_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_site_id"
    t.integer "age"
    t.integer "gender_id"
    t.string "minor_location"
    t.string "major_location"
    t.string "role"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "topic_id"
  end

  create_table "topics", primary_key: "site_id", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "genders", "profiles", column: "profiles_id"
  add_foreign_key "profiles", "topics", primary_key: "site_id"
end
