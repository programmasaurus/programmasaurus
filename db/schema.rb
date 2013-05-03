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

ActiveRecord::Schema.define(version: 20130503011438) do

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "github_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabularies", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vocabularies", ["user_id"], name: "index_vocabularies_on_user_id", using: :btree

  create_table "words", force: true do |t|
    t.string   "synset_id"
    t.integer  "vocabulary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["vocabulary_id"], name: "index_words_on_vocabulary_id", using: :btree

end
