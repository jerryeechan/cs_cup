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

ActiveRecord::Schema.define(version: 20150921085201) do

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commentable_type"
    t.integer  "commentable_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "person_id"
    t.string   "birthday"
    t.string   "school_id"
    t.string   "cellphone"
    t.string   "etc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image"
  end

  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "talents", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "talentType"
    t.integer  "user_id"
  end

  add_index "talents", ["user_id"], name: "index_talents_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.text     "intro"
    t.text     "situation"
    t.text     "needs"
    t.string   "email"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "link"
    t.string   "gender"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "provider"
    t.string   "school"
    t.string   "department"
    t.string   "sport"
    t.string   "transfercode"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "users_talents", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "talent_id"
  end

  add_index "users_talents", ["talent_id"], name: "index_users_talents_on_talent_id"
  add_index "users_talents", ["user_id"], name: "index_users_talents_on_user_id"

end
