# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_12_204900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_examples", force: :cascade do |t|
    t.string "body"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answer_examples_on_question_id"
  end

  create_table "answer_regexps", force: :cascade do |t|
    t.string "regexp"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answer_regexps_on_question_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "body"
    t.integer "score"
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "test_question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["test_question_id"], name: "index_answers_on_test_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "group_revisions", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "revision_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_revisions_on_group_id"
    t.index ["revision_id"], name: "index_group_revisions_on_revision_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.bigint "topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "revision_topics", force: :cascade do |t|
    t.bigint "revision_id"
    t.bigint "topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["revision_id"], name: "index_revision_topics_on_revision_id"
    t.index ["topic_id"], name: "index_revision_topics_on_topic_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "test_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_test_questions_on_question_id"
    t.index ["test_id"], name: "index_test_questions_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "score"
    t.bigint "revision_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["revision_id"], name: "index_tests_on_revision_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "role"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "answer_examples", "questions"
  add_foreign_key "answer_regexps", "questions"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "test_questions"
  add_foreign_key "answers", "users"
  add_foreign_key "group_revisions", "groups"
  add_foreign_key "group_revisions", "revisions"
  add_foreign_key "questions", "topics"
  add_foreign_key "revision_topics", "revisions"
  add_foreign_key "revision_topics", "topics"
  add_foreign_key "test_questions", "questions"
  add_foreign_key "test_questions", "tests"
  add_foreign_key "tests", "revisions"
  add_foreign_key "tests", "users"
  add_foreign_key "users", "groups"
end
