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

ActiveRecord::Schema.define(version: 2021_02_12_165404) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "map_link"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "directions"
    t.index ["name"], name: "index_buildings_on_name", unique: true
  end

  create_table "departmentables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leadership_role", default: 0, null: false
    t.index ["department_id"], name: "index_departmentables_on_department_id"
    t.index ["employee_id"], name: "index_departmentables_on_employee_id"
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.integer "status"
    t.index ["building_id"], name: "index_departments_on_building_id"
  end

  create_table "emails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "address"
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
  end

  create_table "floors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_floors_on_building_id"
    t.index ["name"], name: "index_floors_on_name", unique: true
  end

  create_table "phones", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "number_types"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones"
  end

  create_table "service_points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_service_points_on_department_id"
  end

  create_table "subjectables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_subjectables_on_employee_id"
    t.index ["subject_id"], name: "index_subjectables_on_subject_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "prefix"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "email"
    t.string "wvu_username"
    t.integer "status"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_title"
    t.text "description"
    t.string "image"
    t.string "office_number"
    t.string "type"
    t.string "university_classification"
    t.bigint "department_id"
    t.string "preferred_name"
    t.string "resume"
    t.index ["department_id"], name: "index_users_on_department_id"
  end

end
