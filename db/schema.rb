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

ActiveRecord::Schema[7.0].define(version: 2022_04_14_120850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "infos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "school"
    t.string "disabled"
    t.datetime "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_infos_on_user_id", unique: true
  end

  create_table "results", force: :cascade do |t|
    t.datetime "date"
    t.datetime "time_start"
    t.datetime "game_time"
    t.string "result"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "login", null: false
    t.integer "role", default: 0
    t.string "jti", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "infos", "users"
end
