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

ActiveRecord::Schema.define(version: 2021_03_08_145950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.string "description"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
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
    t.string "title"
    t.text "description"
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
    t.string "place"
    t.index ["accommodation_id"], name: "index_stops_on_accommodation_id"
    t.index ["sample_itinerary_id"], name: "index_stops_on_sample_itinerary_id"
  end

  create_table "travel_styles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "picture"
  end

  create_table "trip_stop_activities", force: :cascade do |t|
    t.bigint "trip_stop_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_trip_stop_activities_on_activity_id"
    t.index ["trip_stop_id"], name: "index_trip_stop_activities_on_trip_stop_id"
  end

  create_table "trip_stops", force: :cascade do |t|
    t.integer "nights"
    t.bigint "trip_id", null: false
    t.bigint "accommodation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accommodation_id"], name: "index_trip_stops_on_accommodation_id"
    t.index ["trip_id"], name: "index_trip_stops_on_trip_id"
  end

  create_table "trip_styles", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "travel_style_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_style_id"], name: "index_trip_styles_on_travel_style_id"
    t.index ["trip_id"], name: "index_trip_styles_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "adults"
    t.integer "children"
    t.boolean "sent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "sample_itinerary_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "accommodations"
  add_foreign_key "sample_itinerary_travel_styles", "sample_itineraries"
  add_foreign_key "sample_itinerary_travel_styles", "travel_styles"
  add_foreign_key "stops", "accommodations"
  add_foreign_key "stops", "sample_itineraries"
  add_foreign_key "trip_stop_activities", "activities"
  add_foreign_key "trip_stop_activities", "trip_stops"
  add_foreign_key "trip_stops", "accommodations"
  add_foreign_key "trip_stops", "trips"
  add_foreign_key "trip_styles", "travel_styles"
  add_foreign_key "trip_styles", "trips"
  add_foreign_key "trips", "users"
end
