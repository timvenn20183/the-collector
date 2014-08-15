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

ActiveRecord::Schema.define(version: 20140815121322) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.string   "collection_id"
    t.integer  "visability"
    t.boolean  "active"
    t.integer  "year"
    t.float    "value"
    t.float    "cost"
    t.string   "cached_slug"
    t.string   "alphabet_letter"
    t.string   "reference_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["site_id"], name: "index_items_on_site_id"

  create_table "sites", force: true do |t|
    t.string   "title"
    t.string   "code"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.string   "owner"
    t.string   "email"
    t.string   "password"
    t.string   "header"
    t.string   "tagline"
    t.text     "tracker_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
