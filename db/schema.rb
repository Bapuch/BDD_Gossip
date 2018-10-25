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

ActiveRecord::Schema.define(version: 2018_10_25_211909) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "gosssip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "related_comment_id"
    t.index ["gosssip_id"], name: "index_comments_on_gosssip_id"
    t.index ["related_comment_id"], name: "index_comments_on_related_comment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gosssips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gosssips_on_user_id"
  end

  create_table "gosssips_tags", id: false, force: :cascade do |t|
    t.integer "gosssip_id", null: false
    t.integer "tag_id", null: false
    t.index ["gosssip_id", "tag_id"], name: "index_gosssips_tags_on_gosssip_id_and_tag_id"
    t.index ["tag_id", "gosssip_id"], name: "index_gosssips_tags_on_tag_id_and_gosssip_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gosssip_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["gosssip_id"], name: "index_likes_on_gosssip_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "private_messages_users", id: false, force: :cascade do |t|
    t.integer "private_message_id"
    t.integer "user_id"
    t.integer "rec_id"
    t.integer "received_message_id"
    t.index ["rec_id", "received_message_id"], name: "index_private_messages_users_on_rec_id_and_received_message_id"
    t.index ["received_message_id", "rec_id"], name: "index_private_messages_users_on_received_message_id_and_rec_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end
