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

ActiveRecord::Schema.define(version: 20150503170836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "journal_id"
  end

  add_index "entries", ["journal_id"], name: "index_entries_on_journal_id", using: :btree

  create_table "entry_exercises", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "entry_exercises", ["entry_id"], name: "index_entry_exercises_on_entry_id", using: :btree
  add_index "entry_exercises", ["exercise_id"], name: "index_entry_exercises_on_exercise_id", using: :btree

  create_table "entry_tags", force: :cascade do |t|
    t.integer  "entry_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_tags", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercise_tags", ["exercise_id"], name: "index_exercise_tags_on_exercise_id", using: :btree
  add_index "exercise_tags", ["tag_id"], name: "index_exercise_tags_on_tag_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id", using: :btree

  create_table "journals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "entry_exercises", "entries"
  add_foreign_key "entry_exercises", "exercises"
  add_foreign_key "exercise_tags", "exercises"
  add_foreign_key "exercise_tags", "tags"
  add_foreign_key "exercises", "users"
end
