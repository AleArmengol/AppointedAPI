# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_11_215336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "patient_id"
    t.string "speciality_name"
    t.integer "status", default: 0
    t.datetime "end_time"
    t.datetime "start_time"
    t.string "doctor_name"
    t.string "patient_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "daily_presets", force: :cascade do |t|
    t.bigint "speciality_id", null: false
    t.bigint "doctor_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_daily_presets_on_doctor_id"
    t.index ["speciality_id"], name: "index_daily_presets_on_speciality_id"
  end

  create_table "doctor_specialities", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "speciality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_specialities_on_doctor_id"
    t.index ["speciality_id"], name: "index_doctor_specialities_on_speciality_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "payment_uptodate"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_frames", force: :cascade do |t|
    t.bigint "daily_preset_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_preset_id"], name: "index_time_frames_on_daily_preset_id"
  end

  create_table "waiting_list_items", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id"
    t.bigint "speciality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_waiting_list_items_on_doctor_id"
    t.index ["patient_id"], name: "index_waiting_list_items_on_patient_id"
    t.index ["speciality_id"], name: "index_waiting_list_items_on_speciality_id"
  end

  create_table "weekly_preset_daily_presets", force: :cascade do |t|
    t.bigint "daily_preset_id", null: false
    t.bigint "weekly_preset_id", null: false
    t.string "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_preset_id"], name: "index_weekly_preset_daily_presets_on_daily_preset_id"
    t.index ["weekly_preset_id"], name: "index_weekly_preset_daily_presets_on_weekly_preset_id"
  end

  create_table "weekly_presets", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_weekly_presets_on_doctor_id"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "daily_presets", "doctors"
  add_foreign_key "daily_presets", "specialities"
  add_foreign_key "doctor_specialities", "doctors"
  add_foreign_key "doctor_specialities", "specialities"
  add_foreign_key "time_frames", "daily_presets"
  add_foreign_key "waiting_list_items", "doctors"
  add_foreign_key "waiting_list_items", "patients"
  add_foreign_key "waiting_list_items", "specialities"
  add_foreign_key "weekly_preset_daily_presets", "daily_presets"
  add_foreign_key "weekly_preset_daily_presets", "weekly_presets"
  add_foreign_key "weekly_presets", "doctors"
end
