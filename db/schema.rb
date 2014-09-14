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

ActiveRecord::Schema.define(version: 20140914191354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meeting_attends", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "meeting_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meeting_attends", ["meeting_id"], name: "index_meeting_attends_on_meeting_id", using: :btree
  add_index "meeting_attends", ["user_id"], name: "index_meeting_attends_on_user_id", using: :btree

  create_table "meetings", force: true do |t|
    t.integer  "creator_id",      null: false
    t.text     "purpose"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetings", ["creator_id"], name: "index_meetings_on_creator_id", using: :btree
  add_index "meetings", ["end_date_time"], name: "index_meetings_on_end_date_time", using: :btree
  add_index "meetings", ["start_date_time"], name: "index_meetings_on_start_date_time", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "author_id",    null: false
    t.integer  "recipient_id", null: false
    t.text     "contents",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["author_id"], name: "index_messages_on_author_id", using: :btree
  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",            null: false
    t.string   "email",               null: false
    t.string   "password_hash",       null: false
    t.text     "life_goals"
    t.text     "job"
    t.text     "hobbies"
    t.text     "reason_to_meet"
    t.integer  "relationship_status"
    t.integer  "personality_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
