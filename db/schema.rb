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

ActiveRecord::Schema.define(version: 20130627131240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",        null: false
    t.string   "timezone",    null: false
    t.integer  "language_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["language_id"], name: "index_accounts_on_language_id", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "flips", force: true do |t|
    t.integer  "from",                        null: false
    t.integer  "to",                          null: false
    t.string   "kind",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                     null: false
    t.boolean  "notification", default: true, null: false
    t.text     "instructions"
  end

  add_index "flips", ["user_id"], name: "index_flips_on_user_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name",         null: false
    t.string   "abbreviation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "email",                null: false
    t.integer "credits",  default: 0, null: false
    t.string  "language",             null: false
  end

end
