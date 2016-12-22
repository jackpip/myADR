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

ActiveRecord::Schema.define(version: 20161222015213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.string   "actor"
    t.integer  "cue_id"
    t.integer  "episode_id"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "abbr"
  end

  create_table "cues", force: :cascade do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.text     "notes"
    t.text     "private_notes"
    t.string   "called_by"
    t.boolean  "omit"
    t.integer  "character_id"
    t.integer  "episode_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "dialogue"
    t.text     "omit_notes"
    t.boolean  "between"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "episode_number"
    t.integer  "show_id"
    t.integer  "character_id"
    t.integer  "cue_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "token"
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.integer  "episode_id"
    t.integer  "character_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shows_users", id: false, force: :cascade do |t|
    t.integer "show_id", null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "show_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
