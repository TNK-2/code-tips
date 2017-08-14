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

ActiveRecord::Schema.define(version: 20170812082810) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "tip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "favourite_tip_id"
    t.integer  "favouritter_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["favourite_tip_id", "favouritter_id"], name: "index_relationships_on_favourite_tip_id_and_favouritter_id", unique: true
    t.index ["favourite_tip_id"], name: "index_relationships_on_favourite_tip_id"
    t.index ["favouritter_id"], name: "index_relationships_on_favouritter_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.string   "contents"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
