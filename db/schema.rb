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

ActiveRecord::Schema.define(version: 2018_07_25_171829) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "line1", limit: 191
    t.string "line2", limit: 191
    t.string "city", limit: 191
    t.string "state", limit: 191
    t.string "zip", limit: 191
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type", limit: 191
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 191, index: { unique: true}
    t.string "map_link", limit: 191
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", limit: 191
    t.index ["name"], name: "index_buildings_on_name", unique: true
  end

  create_table "floors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 191
    t.string "image", limit: 191
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_floors_on_building_id"
    t.index ["name"], name: "index_floors_on_name", unique: true
  end

  create_table "phones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "number_types"
    t.string "number", limit: 191
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phoneable_type", limit: 191
    t.bigint "phoneable_id"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "prefix", limit: 191
    t.string "first_name", limit: 191
    t.string "middle_name", limit: 191
    t.string "last_name", limit: 191
    t.string "suffix", limit: 191
    t.string "email", limit: 191
    t.string "wvu_username", limit: 191
    t.integer "status"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
