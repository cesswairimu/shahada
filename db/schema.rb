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

ActiveRecord::Schema.define(version: 20170413170549) do

  create_table "assignments", force: :cascade do |t|
    t.string   "unit_code"
    t.string   "unit_name"
    t.string   "title"
    t.time     "due_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "lecturer_id"
    t.index ["lecturer_id"], name: "index_assignments_on_lecturer_id"
  end

  create_table "lecturers", force: :cascade do |t|
    t.string   "id_no"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "phone"
    t.string   "school"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tag"
    t.text     "answer"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "reg_no"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "phone"
    t.string   "school"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
