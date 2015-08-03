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

ActiveRecord::Schema.define(version: 20150730131532) do

  create_table "airtimes", force: :cascade do |t|
    t.string   "status"
    t.string   "amount"
    t.string   "phoneNumber"
    t.string   "discount"
    t.string   "requestId"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "username"
    t.string   "apikey"
  end

  create_table "bulks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.string   "message_id"
    t.string   "cost"
    t.string   "number"
    t.string   "message"
    t.string   "apikey"
    t.string   "username"
  end

  create_table "calls", force: :cascade do |t|
    t.integer  "isActive"
    t.string   "sessionId"
    t.string   "direction"
    t.string   "callerNumber"
    t.string   "destinationNumber"
    t.string   "dtmfDigits"
    t.string   "recordingUrl"
    t.string   "durationInSeconds"
    t.string   "currencyCode"
    t.string   "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "username"
    t.string   "apikey"
  end

  create_table "dequeues", force: :cascade do |t|
    t.integer  "isActive"
    t.string   "sessionId"
    t.string   "direction"
    t.string   "callerNumber"
    t.string   "destinationNumber"
    t.string   "dtmfDigits"
    t.string   "recordingUrl"
    t.string   "durationInSeconds"
    t.string   "currencyCode"
    t.datetime "amount"
    t.string   "username"
    t.string   "apikey"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "dtmf2s", force: :cascade do |t|
    t.integer  "isActive"
    t.string   "sessionId"
    t.string   "direction"
    t.string   "callerNumber"
    t.string   "destinationNumber"
    t.string   "dtmfDigits"
    t.string   "recordingUrl"
    t.string   "durationInSeconds"
    t.string   "currencyCode"
    t.string   "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "dtmfs", force: :cascade do |t|
    t.integer  "isActive"
    t.string   "sessionId"
    t.string   "direction"
    t.string   "callerNumber"
    t.string   "destinationNumber"
    t.string   "dtmfDigits"
    t.string   "recordingUrl"
    t.string   "durationInSeconds"
    t.string   "currencyCode"
    t.string   "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "apikey"
    t.string   "username"
  end

  create_table "keysalls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "from"
    t.string   "to"
    t.string   "text"
    t.string   "date"
    t.string   "smsId"
    t.string   "linkId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickcalls", force: :cascade do |t|
    t.integer  "isActive"
    t.string   "sessionId"
    t.string   "direction"
    t.string   "callerNumber"
    t.string   "destinationNumber"
    t.string   "dtmfDigits"
    t.string   "recordingUrl"
    t.string   "durationInSeconds"
    t.string   "currencyCode"
    t.string   "amount"
    t.string   "username"
    t.string   "apikey"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.string   "status"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "number"
    t.string   "shortcode"
    t.string   "keyword"
    t.string   "username"
    t.string   "apikey"
    t.string   "updatetype"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone_Number"
    t.string   "country"
    t.string   "country_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "ussds", force: :cascade do |t|
    t.string   "sessionId"
    t.string   "serviceCode"
    t.string   "phoneNumber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "text"
    t.string   "username"
    t.string   "apikey"
    t.string   "body"
    t.string   "body2"
  end

end
