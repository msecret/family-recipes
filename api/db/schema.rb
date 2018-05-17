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

ActiveRecord::Schema.define(version: 20180416200443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "order"
    t.string   "icon_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cooks", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "cooks_recipes", id: false, force: :cascade do |t|
    t.integer "cook_id"
    t.integer "recipe_id"
    t.index ["cook_id"], name: "index_recipes_cooks_on_cooks_id", using: :btree
    t.index ["recipe_id"], name: "index_recipes_cooks_on_recipes_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.text     "name"
    t.string   "url"
    t.string   "text"
    t.integer  "width_orig"
    t.integer  "height_orig"
    t.integer  "width"
    t.integer  "height"
    t.text     "alt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "cook_id"
    t.index ["cook_id"], name: "index_images_on_cook_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.datetime "preparation_time"
    t.datetime "cooking_time"
    t.text     "memorandums"
    t.integer  "difficulty"
    t.text     "story"
    t.text     "ingredients"
    t.string   "description"
    t.string   "main_photo_url"
    t.integer  "image_id"
    t.integer  "category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["category_id"], name: "index_recipes_on_category_id", using: :btree
    t.index ["image_id"], name: "index_recipes_on_image_id", using: :btree
  end

  add_foreign_key "images", "cooks"
end
