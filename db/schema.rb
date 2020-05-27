# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_27_122025) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "company_name", limit: 150, default: "", null: false
    t.string "name", limit: 20, default: "", null: false
    t.string "email", default: "", null: false
    t.boolean "subscription", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_name"], name: "index_accounts_on_company_name", unique: true
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["name"], name: "index_accounts_on_name", unique: true
  end

  create_table "matters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "accounts_id", null: false
    t.string "control_number", limit: 20, null: false
    t.string "category_name", limit: 30
    t.string "last_modifier", limit: 50
    t.string "customer", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accounts_id"], name: "index_matters_on_accounts_id"
    t.index ["control_number"], name: "index_matters_on_control_number", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "matters", "accounts", column: "accounts_id"
  add_foreign_key "users", "accounts"
end
