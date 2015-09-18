# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150914155057) do

  create_table "games", force: :cascade do |t|
    t.datetime "time"
    t.datetime "date"
    t.string   "location"
    t.integer  "team_score",     default: 0
    t.integer  "opponent_score", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "team_id"
    t.integer  "opponent_id"
  end

  add_index "games", ["team_id"], name: "index_games_on_team_id"

  create_table "players", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "position"
    t.integer  "number"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "fg",         default: 0
    t.integer  "fga",        default: 0
    t.integer  "three_p",    default: 0
    t.integer  "three_p_a",  default: 0
    t.integer  "orb",        default: 0
    t.integer  "drb",        default: 0
    t.integer  "assists",    default: 0
    t.integer  "steals",     default: 0
    t.integer  "blocks",     default: 0
    t.integer  "turnovers",  default: 0
    t.integer  "fouls",      default: 0
    t.integer  "minutes",    default: 0
    t.integer  "player_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "points",     default: 0
    t.integer  "ft",         default: 0
    t.integer  "fta",        default: 0
    t.integer  "game_id"
  end

  add_index "stats", ["game_id"], name: "index_stats_on_game_id"
  add_index "stats", ["player_id"], name: "index_stats_on_player_id"

  create_table "teams", force: :cascade do |t|
    t.string   "school"
    t.string   "nickname"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "league"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
