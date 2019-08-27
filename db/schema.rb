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

ActiveRecord::Schema.define(version: 2019_08_27_081034) do

  create_table "answers", force: :cascade do |t|
    t.text "body"
    t.integer "question_id"
    t.text "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_type", "user_id"], name: "index_answers_on_user_type_and_user_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "unit_code"
    t.string "assignment"
    t.string "title"
    t.date "due_date"
    t.integer "lecturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["lecturer_id"], name: "index_assignments_on_lecturer_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string "id_no"
    t.string "f_name"
    t.string "l_name"
    t.string "email"
    t.string "phone"
    t.string "school"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "tag"
    t.string "category"
    t.integer "user_id"
    t.text "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "reg_no"
    t.string "f_name"
    t.string "l_name"
    t.string "email"
    t.string "phone"
    t.string "school"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
