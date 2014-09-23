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

ActiveRecord::Schema.define(version: 20140922092601) do

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "publish_start"
    t.datetime "publish_end"
    t.boolean  "draft",         default: true
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs_comments", id: false, force: true do |t|
    t.integer "blog_id"
    t.integer "comment_id"
  end

  add_index "blogs_comments", ["blog_id", "comment_id"], name: "blogs_comments_index", unique: true

  create_table "blogs_images", id: false, force: true do |t|
    t.integer "blog_id"
    t.integer "image_id"
  end

  add_index "blogs_images", ["blog_id", "image_id"], name: "blogs_images_index", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_images", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "image_id"
  end

  add_index "categories_images", ["category_id", "image_id"], name: "categories_images_index", unique: true

  create_table "categories_items", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "item_id"
  end

  add_index "categories_items", ["category_id", "item_id"], name: "categories_items_index", unique: true

  create_table "comments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments_items", id: false, force: true do |t|
    t.integer "comment_id"
    t.integer "item_id"
  end

  add_index "comments_items", ["comment_id", "item_id"], name: "comments_items_index", unique: true

  create_table "conditions", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conditions_images", id: false, force: true do |t|
    t.integer "condition_id"
    t.integer "image_id"
  end

  add_index "conditions_images", ["condition_id", "image_id"], name: "conditions_images_index", unique: true

  create_table "conditions_items", id: false, force: true do |t|
    t.integer "condition_id"
    t.integer "item_id"
  end

  add_index "conditions_items", ["condition_id", "item_id"], name: "conditions_items_index", unique: true

  create_table "fieldoptions", force: true do |t|
    t.string   "name"
    t.integer  "itemfield_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fieldoptions", ["itemfield_id"], name: "index_fieldoptions_on_itemfield_id"

  create_table "fieldoptions_images", id: false, force: true do |t|
    t.integer "fieldoption_id"
    t.integer "image_id"
  end

  add_index "fieldoptions_images", ["fieldoption_id", "image_id"], name: "fieldoptions_images_index", unique: true

  create_table "fieldoptions_items", id: false, force: true do |t|
    t.integer "fieldoption_id"
    t.integer "item_id"
  end

  add_index "fieldoptions_items", ["fieldoption_id", "item_id"], name: "fieldoptions_items_index"

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

  create_table "images", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "rawimage"
    t.string   "md5"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images_itemfields", id: false, force: true do |t|
    t.integer "image_id"
    t.integer "itemfield_id"
  end

  add_index "images_itemfields", ["image_id", "itemfield_id"], name: "images_itemfields_index", unique: true

  create_table "images_items", id: false, force: true do |t|
    t.integer "image_id"
    t.integer "item_id"
  end

  add_index "images_items", ["image_id", "item_id"], name: "images_items_index", unique: true

  create_table "images_rolodexes", id: false, force: true do |t|
    t.integer "image_id"
    t.integer "rolodex_id"
  end

  add_index "images_rolodexes", ["image_id", "rolodex_id"], name: "images_rolodexes_index", unique: true

  create_table "images_virtualcollections", id: false, force: true do |t|
    t.integer "image_id"
    t.integer "virtualcollection_id"
  end

  add_index "images_virtualcollections", ["image_id", "virtualcollection_id"], name: "images_virtualcollections_index", unique: true

  create_table "itemfields", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "collection_id"
    t.integer  "visability"
    t.boolean  "active"
    t.integer  "year"
    t.float    "value"
    t.float    "cost"
    t.string   "slug"
    t.string   "alphabet_letter"
    t.string   "reference"
    t.text     "note"
    t.string   "search_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_relateditems", id: false, force: true do |t|
    t.integer "item_id"
    t.integer "relateditem_id"
  end

  add_index "items_relateditems", ["item_id", "relateditem_id"], name: "items_relateditems_index", unique: true

  create_table "items_rolodexes", id: false, force: true do |t|
    t.integer "item_id"
    t.integer "rolodex_id"
  end

  add_index "items_rolodexes", ["item_id", "rolodex_id"], name: "items_rolodexes_index", unique: true

  create_table "items_virtualcollections", id: false, force: true do |t|
    t.integer "item_id"
    t.integer "virtualcollection_id"
  end

  add_index "items_virtualcollections", ["item_id", "virtualcollection_id"], name: "items_virtualcollections_index", unique: true

  create_table "rolodexes", force: true do |t|
    t.string   "name"
    t.integer  "rolodex_type"
    t.string   "email"
    t.string   "cell"
    t.string   "tel"
    t.text     "history"
    t.text     "address"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "virtualcollections", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
