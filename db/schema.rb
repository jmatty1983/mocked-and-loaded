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

ActiveRecord::Schema.define(version: 20150623004458) do

  create_table "mocks", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "qb"
    t.integer  "rb"
    t.integer  "wr"
    t.integer  "te"
    t.integer  "rbwr"
    t.integer  "rbwrte"
    t.integer  "qbrbwrte"
    t.integer  "k"
    t.integer  "dst"
    t.integer  "bn"
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pro_status"
    t.integer  "cbs_id"
    t.string   "pro_team"
    t.integer  "bye_week"
    t.string   "photo_url"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "full_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "mock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
