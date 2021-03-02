# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2021_03_02_152836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "activities", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "price"
    t.bigint "accommodation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accommodation_id"], name: "index_activities_on_accommodation_id"
  end

  create_table "sample_itineraries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_itinerary_travel_styles", force: :cascade do |t|
    t.bigint "sample_itinerary_id", null: false
    t.bigint "travel_style_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_itinerary_id"], name: "index_sample_itinerary_travel_styles_on_sample_itinerary_id"
    t.index ["travel_style_id"], name: "index_sample_itinerary_travel_styles_on_travel_style_id"
  end

  create_table "stops", force: :cascade do |t|
    t.integer "nights"
    t.bigint "accommodation_id", null: false
    t.bigint "sample_itinerary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accommodation_id"], name: "index_stops_on_accommodation_id"
    t.index ["sample_itinerary_id"], name: "index_stops_on_sample_itinerary_id"
  end

  create_table "travel_styles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "adults"
    t.integer "children"
    t.boolean "sent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "accommodations"
  add_foreign_key "sample_itinerary_travel_styles", "sample_itineraries"
  add_foreign_key "sample_itinerary_travel_styles", "travel_styles"
  add_foreign_key "stops", "accommodations"
  add_foreign_key "stops", "sample_itineraries"
end
