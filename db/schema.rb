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

ActiveRecord::Schema.define(version: 2021_03_02_193841) do

  create_table "assignemnts_students", id: false, force: :cascade do |t|
    t.integer "assignemnt_id", null: false
    t.integer "student_id", null: false
    t.string "grade"
    t.index "\"assignment_id\", \"student_id\"", name: "index_assignemnts_students_on_assignment_id_and_student_id"
    t.index "\"student_id\", \"assignment_id\"", name: "index_assignemnts_students_on_student_id_and_assignment_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "username"
    t.string "fname"
    t.string "lname"
    t.string "password_digest"
  end

end
