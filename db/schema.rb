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

ActiveRecord::Schema.define(version: 20151023195901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patrimony_buildings", force: :cascade do |t|
    t.string   "district"
    t.string   "use_type"
    t.string   "catalog"
    t.integer  "file_number"
    t.string   "cadastral_reference"
    t.string   "nature"
    t.string   "address"
    t.text     "description"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimony_historicals", force: :cascade do |t|
    t.string   "inscription"
    t.string   "subinscription"
    t.string   "classification"
    t.integer  "file_number"
    t.text     "description"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimony_renting_buildings", force: :cascade do |t|
    t.string   "subinscription"
    t.string   "nature"
    t.integer  "file_number"
    t.string   "cadastral_reference"
    t.string   "address"
    t.text     "description"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimony_renting_vehicles", force: :cascade do |t|
    t.string   "model"
    t.boolean  "sevices_support",  default: true, null: false
    t.string   "function_detail"
    t.integer  "vehicles_number"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimony_vehicles", force: :cascade do |t|
    t.string   "function_detail"
    t.integer  "vehicles_number"
    t.float    "inventory_value"
    t.date     "application_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
