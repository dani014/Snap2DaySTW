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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130113115056) do

  create_table "comentarios", :force => true do |t|
    t.text     "texto"
    t.integer  "usuario_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "titulo"
    t.string   "extension"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  add_index "posts", ["usuario_id"], :name => "index_posts_on_usuario_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "usuarios", :force => true do |t|
    t.string   "username",                            :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",            :default => false
    t.boolean  "sexo",             :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
