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

ActiveRecord::Schema.define(version: 2018_05_19_085546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.boolean "anonymous", default: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "flash_card_id"
    t.index ["flash_card_id"], name: "index_cards_on_flash_card_id"
  end

  create_table "flash_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.index ["user_id"], name: "index_flash_cards_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "question"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_problems_on_quiz_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "answer"
    t.boolean "correct", default: false
    t.bigint "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_solutions_on_problem_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "0"
    t.string "qualification"
    t.boolean "verified", default: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "vote"
    t.bigint "user_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_votes_on_answer_id"
    t.index ["question_id"], name: "index_votes_on_question_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "problems", "quizzes"
  add_foreign_key "questions", "users"
  add_foreign_key "quizzes", "users"
  add_foreign_key "solutions", "problems"
  add_foreign_key "votes", "answers"
  add_foreign_key "votes", "questions"
  add_foreign_key "votes", "users"
end
