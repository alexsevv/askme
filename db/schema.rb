ActiveRecord::Schema.define(version: 20170606074804) do

  create_table "hashtag_questions", force: :cascade do |t|
    t.integer  "hashtag_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hashtag_id", "question_id"], name: "index_hashtag_questions_on_hashtag_id_and_question_id", unique: true
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hashtags_on_name", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "author_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "avatar_url"
    t.string   "header_color"
    t.index ["username"], name: "index_users_on_username", unique: true
  end
end
