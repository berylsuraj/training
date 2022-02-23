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

ActiveRecord::Schema.define(version: 2022_02_23_050135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_histories", force: :cascade do |t|
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_histories_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "employee_id"
    t.string "account_num"
    t.index ["employee_id"], name: "index_accounts_on_employee_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "department_id"
    t.string "name"
    t.integer "age"
    t.float "salary"
    t.boolean "is_working"
    t.string "email"
    t.string "email_confirmation"
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.bigint "employee_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["employee_id"], name: "index_jobs_on_employee_id"
  end

  create_table "logins", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.bigint "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "login_type"
    t.index ["employee_id"], name: "index_logins_on_employee_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "color"
    t.integer "size"
    t.datetime "purchased_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "projectable_type"
    t.bigint "projectable_id"
    t.index ["projectable_type", "projectable_id"], name: "index_projects_on_projectable"
  end

  add_foreign_key "account_histories", "accounts"
  add_foreign_key "accounts", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "employees"
  add_foreign_key "logins", "employees"
end
