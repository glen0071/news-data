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

ActiveRecord::Schema.define(version: 20160306174620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "url"
    t.string   "source"
    t.text     "snippet"
    t.text     "headline"
    t.integer  "response_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "pub_date"
  end

  add_index "articles", ["response_id"], name: "index_articles_on_response_id", using: :btree

  create_table "queries", force: :cascade do |t|
    t.string   "search_terms"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "response_id"
  end

  add_index "queries", ["response_id"], name: "index_queries_on_response_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string   "search_terms"
    t.string   "query_url"
    t.integer  "articles_amount"
    t.integer  "query_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "responses", ["query_id"], name: "index_responses_on_query_id", using: :btree

  add_foreign_key "articles", "responses"
  add_foreign_key "queries", "responses"
  add_foreign_key "responses", "queries"
end
