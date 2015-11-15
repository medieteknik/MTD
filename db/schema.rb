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

ActiveRecord::Schema.define(version: 20150325200350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booths", force: :cascade do |t|
    t.boolean  "first_day"
    t.boolean  "second_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
    t.integer  "mode"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "sponsor"
    t.boolean  "first_day"
    t.boolean  "second_day"
    t.integer  "first_day_booth_id"
    t.integer  "second_day_booth_id"
    t.boolean  "published"
    t.integer  "image_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "extended"
    t.string   "identifier"
    t.string   "color"
    t.string   "initials"
  end

  add_index "companies", ["image_id"], name: "index_companies_on_image_id", using: :btree

  create_table "companies_users", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
  end

  add_index "companies_users", ["company_id"], name: "index_companies_users_on_company_id", using: :btree
  add_index "companies_users", ["user_id"], name: "index_companies_users_on_user_id", using: :btree

  create_table "company_translations", force: :cascade do |t|
    t.integer  "company_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "looking_for"
  end

  add_index "company_translations", ["company_id"], name: "index_company_translations_on_company_id", using: :btree
  add_index "company_translations", ["locale"], name: "index_company_translations_on_locale", using: :btree

  create_table "host_position_translations", force: :cascade do |t|
    t.integer  "host_position_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "position"
  end

  add_index "host_position_translations", ["host_position_id"], name: "index_host_position_translations_on_host_position_id", using: :btree
  add_index "host_position_translations", ["locale"], name: "index_host_position_translations_on_locale", using: :btree

  create_table "host_positions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "need",       default: 0
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "name"
    t.string   "liuid"
    t.string   "phone"
    t.integer  "year"
    t.text     "reason"
    t.string   "size"
    t.boolean  "member"
    t.boolean  "banquet"
    t.string   "allergies"
    t.text     "other"
    t.integer  "first"
    t.integer  "second"
    t.integer  "third"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   default: 0
  end

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "unique_id"
    t.string   "filetype"
    t.string   "filepath"
    t.integer  "filesize"
    t.integer  "user_id"
    t.string   "thumb_url"
    t.string   "thumb_path"
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "images_photo_albums", id: false, force: :cascade do |t|
    t.integer "photo_album_id"
    t.integer "image_id"
  end

  create_table "lecture_translations", force: :cascade do |t|
    t.integer  "lecture_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "title"
  end

  add_index "lecture_translations", ["lecture_id"], name: "index_lecture_translations_on_lecture_id", using: :btree
  add_index "lecture_translations", ["locale"], name: "index_lecture_translations_on_locale", using: :btree

  create_table "lectures", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "start"
    t.datetime "stop"
    t.boolean  "published"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lectures", ["image_id"], name: "index_lectures_on_image_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "links", ["company_id"], name: "index_links_on_company_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "status"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_translations", force: :cascade do |t|
    t.integer  "news_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "content"
  end

  add_index "news_translations", ["locale"], name: "index_news_translations_on_locale", using: :btree
  add_index "news_translations", ["news_id"], name: "index_news_translations_on_news_id", using: :btree

  create_table "news_users", force: :cascade do |t|
    t.integer "news_id"
    t.integer "user_id"
  end

  create_table "photo_album_translations", force: :cascade do |t|
    t.integer  "photo_album_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
  end

  add_index "photo_album_translations", ["locale"], name: "index_photo_album_translations_on_locale", using: :btree
  add_index "photo_album_translations", ["photo_album_id"], name: "index_photo_album_translations_on_photo_album_id", using: :btree

  create_table "photo_albums", force: :cascade do |t|
    t.boolean  "published"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order",      default: 0
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "studentexpos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "members"
    t.string   "liuid"
    t.string   "name"
    t.string   "course"
    t.boolean  "need_computer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: :cascade do |t|
    t.text     "content"
    t.string   "email"
    t.boolean  "seen"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "locale"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "companies", "images"
  add_foreign_key "images", "users"
  add_foreign_key "lectures", "images"
  add_foreign_key "links", "companies"
end
