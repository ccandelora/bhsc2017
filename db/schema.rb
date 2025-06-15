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

ActiveRecord::Schema[7.1].define(version: 2025_06_15_125907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "message"
    t.integer "order"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "public_pins", id: :serial, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.index ["user_id"], name: "index_public_pins_on_user_id"
  end

  create_table "reservation_weeks", id: :serial, force: :cascade do |t|
    t.text "note"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.date "res_date"
  end

  create_table "reservations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "wed"
    t.boolean "thur"
    t.boolean "fri"
    t.boolean "sat"
    t.boolean "sun"
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "dinner"
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.integer "reservation_week_id"
    t.string "sex"
    t.string "res_member_type"
    t.date "reservation_date"
    t.index ["reservation_week_id"], name: "index_reservations_on_reservation_week_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "name"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
