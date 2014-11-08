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

ActiveRecord::Schema.define(version: 20141108101440) do

  create_table "exo_planets", force: true do |t|
    t.string   "label"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.integer  "numplanets"
    t.float    "distance"
    t.integer  "texture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_groups", force: true do |t|
    t.string   "label"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.string   "distly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_clusters", force: true do |t|
    t.string   "label"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.float    "diam"
    t.float    "logage"
    t.float    "metal"
    t.float    "distly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stars", force: true do |t|
    t.string   "label"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.float    "lum"
    t.float    "colorb_v"
    t.float    "absmag"
    t.float    "appmag"
    t.float    "texnum"
    t.float    "distly"
    t.float    "dcalc"
    t.float    "plx"
    t.float    "plxerr"
    t.float    "vx"
    t.float    "vy"
    t.float    "vz"
    t.float    "speed"
    t.float    "hipnum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
