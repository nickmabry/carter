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

ActiveRecord::Schema.define(version: 20170504131737) do

  create_table "carts", id: nil, force: :cascade do |t|
    t.index ["id"], name: "sqlite_autoindex_carts_1", unique: true
  end

  create_table "items", id: nil, force: :cascade do |t|
    t.string  "cart_id",     null: false
    t.string  "external_id", null: false
    t.string  "name"
    t.integer "value"
    t.index ["cart_id", "external_id"], name: "index_items_on_cart_id_and_external_id", unique: true
    t.index ["id"], name: "sqlite_autoindex_items_1", unique: true
  end

end
