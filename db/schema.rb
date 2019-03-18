ActiveRecord::Schema.define(version: 20190315131034) do

  create_table "answers", force: :cascade do |t|
    t.string "answer_content"
    t.boolean "is_correct"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_name"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_attachments_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_attachments_on_lesson_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "buy_times"
    t.float "rate"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excercises", force: :cascade do |t|
    t.string "excercise_name"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_excercises_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_excercises_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_title"
    t.string "lesson_status"
    t.string "lesson_content"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_lessons_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_content"
    t.integer "excercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_id", "created_at"], name: "index_questions_on_excercise_id_and_created_at"
    t.index ["excercise_id"], name: "index_questions_on_excercise_id"
  end

  create_table "user_course_lessons", force: :cascade do |t|
    t.integer "user_course_id"
    t.integer "lesson_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_course_lessons_on_lesson_id"
    t.index ["user_course_id", "lesson_id"], name: "index_user_course_lessons_on_user_course_id_and_lesson_id", unique: true
    t.index ["user_course_id"], name: "index_user_course_lessons_on_user_course_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id", "course_id"], name: "index_user_courses_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
  end

end
