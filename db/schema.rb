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

ActiveRecord::Schema.define(version: 20161011021022) do

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "in_home_nannies", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "hope_baby_quantity"
    t.integer  "number_of_baby_care"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["nanny_id"], name: "index_in_home_nannies_on_nanny_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "zipcode_id"
    t.string   "address"
    t.string   "location_type"
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["zipcode_id"], name: "index_locations_on_zipcode_id"
  end

  create_table "nannies", force: :cascade do |t|
    t.text     "introduction"
    t.string   "license_number"
    t.date     "since"
    t.date     "care_start_date"
    t.string   "nanny_type"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "long_tern"
    t.boolean  "short_tern"
    t.integer  "min_care_hour"
    t.index ["user_id"], name: "index_nannies_on_user_id"
  end

  create_table "nanny_charges", force: :cascade do |t|
    t.integer  "nanny_id"
    t.string   "period"
    t.string   "date_type"
    t.string   "charge_name"
    t.string   "charge_unit"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["nanny_id"], name: "index_nanny_charges_on_nanny_id"
  end

  create_table "nanny_orther_qualification_ships", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "orther_qualification_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["nanny_id"], name: "index_nanny_orther_qualification_ships_on_nanny_id"
    t.index ["orther_qualification_id"], name: "orther_qualification_index"
  end

  create_table "nanny_preference_ships", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "preference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["nanny_id"], name: "index_nanny_preference_ships_on_nanny_id"
    t.index ["preference_id"], name: "index_nanny_preference_ships_on_preference_id"
  end

  create_table "nanny_qualification_ships", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "qualification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["nanny_id"], name: "index_nanny_qualification_ships_on_nanny_id"
    t.index ["qualification_id"], name: "index_nanny_qualification_ships_on_qualification_id"
  end

  create_table "nanny_zipcode_ships", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "zipcode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nanny_id"], name: "index_nanny_zipcode_ships_on_nanny_id"
    t.index ["zipcode_id"], name: "index_nanny_zipcode_ships_on_zipcode_id"
  end

  create_table "orther_qualifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_settings", force: :cascade do |t|
    t.integer  "nanny_id"
    t.integer  "week"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "available"
    t.index ["nanny_id"], name: "index_schedule_settings_on_nanny_id"
    t.index ["week"], name: "index_schedule_settings_on_week"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "phone"
    t.date     "birthdate"
    t.string   "user_type"
    t.string   "line_id"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.text     "fb_raw_data"
    t.string   "fb_pic"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zipcodes", force: :cascade do |t|
    t.integer  "zipcode"
    t.string   "city"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode"], name: "index_zipcodes_on_zipcode"
  end

end
