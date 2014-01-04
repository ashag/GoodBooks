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

ActiveRecord::Schema.define(version: 20140104010049) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "rating"
    t.date     "start_date"
    t.date     "completed_date"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookshelves", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read"
    t.boolean  "wants_to_read"
    t.boolean  "currently_reading"
  end

  create_table "bookshelves_books", force: true do |t|
    t.integer  "bookshelf_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
