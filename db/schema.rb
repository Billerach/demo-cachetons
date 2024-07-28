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

ActiveRecord::Schema[7.1].define(version: 2024_07_28_143615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "siret"
    t.string "naf"
    t.string "address"
    t.string "license_number"
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.string "name"
    t.string "fund"
    t.float "employee_part"
    t.float "employer_part"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.string "phone"
    t.string "phone_2"
    t.string "NIR"
    t.string "conges_spectacles"
    t.date "date_of_birth"
    t.string "place_of_birth"
    t.string "departement_of_birth"
    t.string "country_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "job_profiles", force: :cascade do |t|
    t.string "name"
    t.boolean "executive", default: false, null: false
    t.boolean "artist", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_profiles_to_contributions_links", force: :cascade do |t|
    t.bigint "job_profile_id"
    t.bigint "contribution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_id"], name: "index_job_profiles_to_contributions_links_on_contribution_id"
    t.index ["job_profile_id"], name: "index_job_profiles_to_contributions_links_on_job_profile_id"
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "payslip_number"
    t.date "contract_start"
    t.date "contract_end"
    t.date "payment_date"
    t.string "payment_id"
    t.string "job_profile"
    t.integer "hours_per_day"
    t.integer "number_of_days"
    t.boolean "executive"
    t.integer "allowance"
    t.float "basis"
    t.float "basis_per_day"
    t.float "allowance_basis"
    t.integer "number_of_hours"
    t.float "employer_s_contribution"
    t.float "employee_s_contribution"
    t.float "net_salary"
    t.float "taxable_net"
    t.float "urssaf_limit"
    t.float "employer_cost"
    t.integer "number_of_performance", default: 0
    t.integer "number_of_rehearsal", default: 0
    t.float "gross_salary_accumulation"
    t.float "taxable_net_accumulation"
    t.float "net_accumulation"
    t.float "urssaf_limit_accumulation"
    t.float "employer_cost_accumulation"
    t.integer "hours_accumulation"
    t.boolean "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "employee_id"
    t.bigint "performance_id"
    t.index ["company_id"], name: "index_payslips_on_company_id"
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
    t.index ["performance_id"], name: "index_payslips_on_performance_id"
  end

  create_table "payslips_to_contributions_links", force: :cascade do |t|
    t.bigint "payslip_id"
    t.bigint "contribution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_id"], name: "index_payslips_to_contributions_links_on_contribution_id"
    t.index ["payslip_id"], name: "index_payslips_to_contributions_links_on_payslip_id"
  end

  create_table "performances", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "num_objet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_performances_on_company_id"
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "job_profiles_to_contributions_links", "contributions"
  add_foreign_key "job_profiles_to_contributions_links", "job_profiles"
  add_foreign_key "payslips", "companies"
  add_foreign_key "payslips", "employees"
  add_foreign_key "payslips", "performances"
  add_foreign_key "payslips_to_contributions_links", "contributions"
  add_foreign_key "payslips_to_contributions_links", "payslips"
  add_foreign_key "performances", "companies"
end
