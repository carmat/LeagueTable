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

ActiveRecord::Schema.define(version: 20150719104320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.integer  "home_team"
    t.integer  "home_goals"
    t.integer  "away_team"
    t.integer  "away_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "releg_places"
    t.integer  "releg_playoff_places"
    t.integer  "promo_places"
    t.integer  "promo_playoff_places"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team"
    t.integer  "league_id"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["id"], name: "index_teams_on_id", using: :btree
  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree
  add_index "teams", ["season_id"], name: "index_teams_on_season_id", using: :btree

  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "seasons"
end
