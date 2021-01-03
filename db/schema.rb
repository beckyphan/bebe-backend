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

ActiveRecord::Schema.define(version: 2021_01_03_185733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bebes", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "kind"
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img"
    t.index ["user_id"], name: "index_bebes_on_user_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "picture"
    t.date "date"
    t.text "note"
    t.bigint "bebe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bebe_id"], name: "index_days_on_bebe_id"
  end

  create_table "trackings", force: :cascade do |t|
    t.string "info_type"
    t.time "start_time"
    t.time "end_time"
    t.float "amount"
    t.string "amount_unit"
    t.text "note"
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_trackings_on_day_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "trackings", "days"
end
