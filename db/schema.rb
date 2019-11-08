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

ActiveRecord::Schema.define(version: 2019_11_08_004538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "parent_user_id"
    t.bigint "sitter_user_id"
    t.bigint "payment_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["parent_user_id"], name: "index_meetings_on_parent_user_id"
    t.index ["payment_id"], name: "index_meetings_on_payment_id"
    t.index ["sitter_user_id"], name: "index_meetings_on_sitter_user_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "mother_name"
    t.string "father_name"
    t.integer "children"
    t.text "description"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.boolean "paid"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meeting_id"
    t.index ["meeting_id"], name: "index_payments_on_meeting_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sitters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "age"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "social_link"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_sitters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.string "fullname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "meetings", "payments"
  add_foreign_key "meetings", "users"
  add_foreign_key "meetings", "users", column: "parent_user_id"
  add_foreign_key "meetings", "users", column: "sitter_user_id"
  add_foreign_key "parents", "users"
  add_foreign_key "payments", "meetings"
  add_foreign_key "sitters", "users"
  add_foreign_key "users", "roles"
end
