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

ActiveRecord::Schema.define(version: 20160129083124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
  end

  create_table "contact_translations", force: :cascade do |t|
    t.integer  "contact_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bio"
  end

  add_index "contact_translations", ["contact_id"], name: "index_contact_translations_on_contact_id", using: :btree
  add_index "contact_translations", ["locale"], name: "index_contact_translations_on_locale", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "contact_id"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
