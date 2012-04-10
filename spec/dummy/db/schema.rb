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

ActiveRecord::Schema.define(:version => 20111014161437) do

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_app_id"
    t.string   "token"
    t.datetime "expires_at"
    t.string   "redirect_uri"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "authorizations", ["client_app_id"], :name => "index_authorizations_on_client_app_id"
  add_index "authorizations", ["expires_at"], :name => "index_authorizations_on_expires_at"
  add_index "authorizations", ["token"], :name => "index_authorizations_on_token", :unique => true
  add_index "authorizations", ["user_id"], :name => "index_authorizations_on_user_id"

  create_table "client_apps", :force => true do |t|
    t.string   "name"
    t.string   "redirect_uri"
    t.string   "website"
    t.string   "app_identifier"
    t.string   "secret"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "client_apps", ["app_identifier"], :name => "index_client_apps_on_app_identifier", :unique => true

  create_table "grant_access_tokens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_app_id"
    t.integer  "refresh_request_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "grant_access_tokens", ["client_app_id"], :name => "index_grant_access_tokens_on_client_app_id"
  add_index "grant_access_tokens", ["expires_at"], :name => "index_grant_access_tokens_on_expires_at"
  add_index "grant_access_tokens", ["token"], :name => "index_grant_access_tokens_on_token", :unique => true
  add_index "grant_access_tokens", ["user_id"], :name => "index_grant_access_tokens_on_user_id"

  create_table "refresh_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_app_id"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "refresh_requests", ["client_app_id"], :name => "index_refresh_requests_on_client_app_id"
  add_index "refresh_requests", ["expires_at"], :name => "index_refresh_requests_on_expires_at"
  add_index "refresh_requests", ["token"], :name => "index_refresh_requests_on_token", :unique => true
  add_index "refresh_requests", ["user_id"], :name => "index_refresh_requests_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

end
