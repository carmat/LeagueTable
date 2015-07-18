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

ActiveRecord::Schema.define(version: 20150718131020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "home_team"
    t.string   "away_team"
  end

  add_index "fixtures", ["id"], name: "index_fixtures_on_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "enc_password"
  end

  add_index "players", ["id"], name: "index_players_on_id", using: :btree

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id",   null: false
  end

  add_index "players_teams", ["player_id", "team_id"], name: "index_players_teams_on_player_id_and_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string  "team"
    t.integer "player_id"
  end

  add_index "teams", ["id"], name: "index_teams_on_id", using: :btree
  add_index "teams", ["player_id"], name: "index_teams_on_player_id", using: :btree

  add_foreign_key "teams", "players"
end
