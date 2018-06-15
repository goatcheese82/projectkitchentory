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

ActiveRecord::Schema.define(version: 2018_06_14_212225) do

  create_table "Users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "things", force: :cascade do |t|
    t.integer "inventory_id"
    t.string "title"
    t.integer "quantity"
    t.text "description"
    t.index ["inventory_id"], name: "index_things_on_inventory_id"
  end

end
