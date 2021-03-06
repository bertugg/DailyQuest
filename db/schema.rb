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

ActiveRecord::Schema.define(version: 20160510224938) do

  create_table "quests", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userquests", id: false, force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "quests_id"
    t.datetime "expiredate", default: '2016-05-11 00:00:00', null: false
    t.boolean  "isdone",     default: false
  end

  add_index "userquests", ["quests_id"], name: "index_userquests_on_quests_id"
  add_index "userquests", ["users_id"], name: "index_userquests_on_users_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
