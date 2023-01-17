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

ActiveRecord::Schema[7.0].define(version: 2023_01_17_205551) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "aeroplane_class_seats", force: :cascade do |t|
    t.bigint "aeroplane_id", null: false
    t.bigint "aeroplane_class_id", null: false
    t.integer "row_seats", null: false
    t.integer "row_numbers", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aeroplane_class_id"], name: "index_aeroplane_class_seats_on_aeroplane_class_id"
    t.index ["aeroplane_id", "aeroplane_class_id"], name: "index_aeroplane_class_seats_on_aeroplane_and_aeroplane_class", unique: true
    t.index ["aeroplane_id"], name: "index_aeroplane_class_seats_on_aeroplane_id"
  end

  create_table "aeroplane_classes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aeroplanes", force: :cascade do |t|
    t.string "aeroplane_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aeroplane_type"], name: "index_aeroplanes_on_aeroplane_type", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.string "origin", null: false
    t.string "destination", null: false
    t.datetime "at", null: false
    t.bigint "aeroplane_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aeroplane_id"], name: "index_flights_on_aeroplane_id"
  end

  create_table "pnrs", force: :cascade do |t|
    t.bigint "flight_id", null: false
    t.bigint "aeroplane_class_id", null: false
    t.string "pnr", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aeroplane_class_seat_id", null: false
    t.index ["aeroplane_class_id"], name: "index_pnrs_on_aeroplane_class_id"
    t.index ["aeroplane_class_seat_id"], name: "index_pnrs_on_aeroplane_class_seat_id"
    t.index ["flight_id", "pnr"], name: "index_pnrs_on_flight_id_and_pnr", unique: true
    t.index ["flight_id"], name: "index_pnrs_on_flight_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pnr_id", null: false
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pnr_id"], name: "index_reservations_on_pnr_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "phone"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aeroplane_class_seats", "aeroplane_classes"
  add_foreign_key "aeroplane_class_seats", "aeroplanes"
  add_foreign_key "flights", "aeroplanes"
  add_foreign_key "pnrs", "aeroplane_class_seats"
  add_foreign_key "pnrs", "aeroplane_classes"
  add_foreign_key "pnrs", "flights"
  add_foreign_key "reservations", "pnrs"
  add_foreign_key "reservations", "users"
end
