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

ActiveRecord::Schema.define(version: 2018_08_20_061054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "prompt_loveline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_loveline_id"], name: "index_answers_on_prompt_loveline_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "lovelines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "image_url"
    t.bigint "loveline_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loveline_id"], name: "index_posts_on_loveline_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prompt_lovelines", force: :cascade do |t|
    t.bigint "prompt_id"
    t.bigint "loveline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loveline_id"], name: "index_prompt_lovelines_on_loveline_id"
    t.index ["prompt_id"], name: "index_prompt_lovelines_on_prompt_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.text "content"
    t.integer "score", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "avatar_url"
    t.integer "gender"
    t.string "open_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loveline_id"
    t.index ["loveline_id"], name: "index_users_on_loveline_id"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "answers", "prompt_lovelines"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "lovelines"
  add_foreign_key "posts", "users"
  add_foreign_key "prompt_lovelines", "lovelines"
  add_foreign_key "prompt_lovelines", "prompts"
  add_foreign_key "users", "lovelines"
end
