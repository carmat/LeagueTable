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

ActiveRecord::Schema.define(version: 20150721204034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.integer  "home_team"
    t.integer  "home_goals"
    t.integer  "away_team"
    t.integer  "away_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "league_id"
  end

  add_index "fixtures", ["league_id"], name: "index_fixtures_on_league_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "rel_places"
    t.integer  "rel_playoff_places"
    t.integer  "promo_places"
    t.integer  "promo_playoff_places"
    t.integer  "previous_league"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "season_id"
    t.integer  "promo_to"
    t.integer  "promo_from"
    t.integer  "rel_to"
    t.integer  "rel_from"
  end

  add_index "leagues", ["season_id"], name: "index_leagues_on_season_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "team"
    t.integer  "league_id"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["league_id"], name: "index_players_on_league_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fixtures", "leagues"
  add_foreign_key "leagues", "seasons"
  add_foreign_key "players", "leagues"
end
