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

ActiveRecord::Schema.define(:version => 20100924123141) do

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "years_of_web_programming_experience",  :default => 1
    t.integer  "years_of_programming_experience",      :default => 1
    t.integer  "years_of_ruby_experience",             :default => 1
    t.integer  "years_of_rails_experience",            :default => 1
    t.string   "current_primary_programming_language"
    t.string   "preferred_os"
    t.string   "preferred_ide"
    t.boolean  "has_laptop",                           :default => true
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "tags"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promoted"
    t.boolean  "published"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "tweets", :force => true do |t|
    t.string   "user_name"
    t.string   "body"
    t.string   "twitter_id"
    t.string   "twitter_status_id"
    t.datetime "tweet_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["tweet_date"], :name => "index_tweets_on_tweet_date"
  add_index "tweets", ["twitter_id"], :name => "index_tweets_on_twitter_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login",                                      :null => false
    t.string   "crypted_password",                           :null => false
    t.string   "password_salt",                              :null => false
    t.string   "email",                                      :null => false
    t.string   "persistence_token",                          :null => false
    t.string   "perishable_token",                           :null => false
    t.string   "single_access_token",                        :null => false
    t.integer  "login_count",          :default => 0,        :null => false
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "user_type",            :default => "Member", :null => false
    t.string   "gender"
    t.string   "job_title"
    t.string   "company_organization"
    t.string   "website"
    t.string   "twitter_id"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["user_type"], :name => "index_users_on_user_type"

end
