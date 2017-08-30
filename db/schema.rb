ActiveRecord::Schema.define(version: 20170503171724) do

  create_table "assignments", force: :cascade do |t|
    t.string   "unit_code"
    t.string   "attachment"
    t.string   "title"
    t.date     "due_date"
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
