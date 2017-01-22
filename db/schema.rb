# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170121204129) do

  create_table "cook_books", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cook_books", ["user_id"], name: "index_cook_books_on_user_id"

  create_table "courses_menus", force: :cascade do |t|
    t.string   "course_name"
    t.string   "day"
    t.integer  "menu_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses_menus", ["menu_id"], name: "index_courses_menus_on_menu_id"

  create_table "courses_menus_recipes", id: false, force: :cascade do |t|
    t.integer "courses_menu_id"
    t.integer "recipe_id"
  end

  add_index "courses_menus_recipes", ["courses_menu_id"], name: "index_courses_menus_recipes_on_courses_menu_id"
  add_index "courses_menus_recipes", ["recipe_id"], name: "index_courses_menus_recipes_on_recipe_id"

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "menus", ["user_id"], name: "index_menus_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "img_url"
    t.string   "title"
    t.string   "source_url"
    t.integer  "cook_book_id"
  end

  add_index "recipes", ["cook_book_id"], name: "index_recipes_on_cook_book_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
