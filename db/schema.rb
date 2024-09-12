# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_11_141020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "file_path"
    t.bigint "pages_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pages_id"], name: "index_attachments_on_pages_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.date "posted_at"
    t.text "body"
    t.string "attachment"
    t.bigint "pages_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pages_id"], name: "index_comments_on_pages_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "due_by"
    t.integer "priority"
    t.integer "difficulty"
    t.integer "status"
    t.integer "progress"
    t.integer "reminder"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_pages_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "profile_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attachments", "pages", column: "pages_id"
  add_foreign_key "comments", "pages", column: "pages_id"
  add_foreign_key "pages", "users", column: "users_id"
end
