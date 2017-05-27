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

ActiveRecord::Schema.define(version: 20170527072308) do

  create_table "circles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circles_people", id: false, force: :cascade do |t|
    t.integer "circles_id"
    t.integer "person_id"
    t.index ["circles_id", "person_id"], name: "index_circles_people_on_circles_id_and_person_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.integer "circle_id", null: false
    t.string "title", null: false
    t.text "content"
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
