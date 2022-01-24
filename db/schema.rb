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

ActiveRecord::Schema.define(version: 2022_01_24_112417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meeting_types", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "image"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "color"
    t.string "image"
    t.string "link"
    t.string "attendee_limit"
    t.bigint "user_id", null: false
    t.bigint "meeting_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_type_id"], name: "index_meetings_on_meeting_type_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meeting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_id"], name: "index_reservations_on_meeting_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "full_name"
    t.string "avatar"
    t.date "birthday"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "meetings", "meeting_types"
  add_foreign_key "meetings", "users"
  add_foreign_key "reservations", "meetings"
  add_foreign_key "reservations", "users"
  add_foreign_key "user_details", "users"
end
