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

ActiveRecord::Schema.define(version: 20160224194202) do

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "friendings", force: :cascade do |t|
    t.integer  "initiator_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "likes", ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "photo_info_file_name"
    t.string   "photo_info_content_type"
    t.integer  "photo_info_file_size"
    t.datetime "photo_info_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "birthday"
    t.string   "hometown"
    t.string   "current_location"
    t.string   "school"
    t.string   "motto"
    t.text     "about"
    t.string   "telephone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "gender"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "avatar_id"
    t.integer  "cover_photo_id"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["avatar_id"], name: "index_users_on_avatar_id"
  add_index "users", ["cover_photo_id"], name: "index_users_on_cover_photo_id"

end
