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

ActiveRecord::Schema.define(version: 20160623181202) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "color",           limit: 255
    t.string   "base_attributes", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "characters_nodes", id: false, force: :cascade do |t|
    t.integer "character_id", limit: 4, null: false
    t.integer "node_id",      limit: 4, null: false
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "x",              limit: 4
    t.integer  "y",              limit: 4
    t.string   "connections",    limit: 255
    t.string   "attribute_name", limit: 255
    t.integer  "value",          limit: 4
    t.integer  "ability_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
