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

ActiveRecord::Schema.define(version: 2021_02_26_113015) do

  create_table "athletes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday", null: false
    t.integer "prefecture_id", null: false
    t.integer "affiliation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_athletes_on_name", unique: true
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "event_day", null: false
    t.string "venue", null: false
    t.integer "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_day"], name: "index_games_on_event_day", unique: true
  end

  create_table "scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "floor_d", null: false
    t.float "floor_e", null: false
    t.float "floor_nd", null: false
    t.float "pommel_d", null: false
    t.float "pommel_e", null: false
    t.float "pommel_nd", null: false
    t.float "rings_d", null: false
    t.float "rings_e", null: false
    t.float "rings_nd", null: false
    t.float "vault_d", null: false
    t.float "vault_e", null: false
    t.float "vault_nd", null: false
    t.float "parallel_d", null: false
    t.float "parallel_e", null: false
    t.float "parallel_nd", null: false
    t.float "horizontal_d", null: false
    t.float "horizontal_e", null: false
    t.float "horizontal_nd", null: false
    t.bigint "athlete_id"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["athlete_id"], name: "index_scores_on_athlete_id"
    t.index ["game_id"], name: "index_scores_on_game_id"
  end

  create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.date "birthday", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "scores", "athletes"
  add_foreign_key "scores", "games"
  add_foreign_key "sns_credentials", "users"
end
