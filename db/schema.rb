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

ActiveRecord::Schema.define(version: 20201128163324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_guests_on_reservation_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "message"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_pins", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_public_pins_on_user_id", using: :btree
  end

  create_table "reservation_weeks", force: :cascade do |t|
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "res_date"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "wed"
    t.boolean  "thur"
    t.boolean  "fri"
    t.boolean  "sat"
    t.boolean  "sun"
    t.boolean  "mon"
    t.boolean  "tue"
    t.boolean  "dinner"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "reservation_week_id"
    t.string   "sex"
    t.string   "res_member_type"
    t.date     "reservation_date"
    t.integer  "guests",              limit: 2
    t.index ["reservation_week_id"], name: "index_reservations_on_reservation_week_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

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
    t.string   "name"
    t.integer  "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "guests", "reservations"
end
