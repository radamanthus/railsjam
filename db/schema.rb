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

ActiveRecord::Schema.define(:version => 20101001150934) do

  create_table "attachments", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"
  add_index "attachments", ["file_file_name", "file_content_type", "file_file_size", "attachable_id", "attachable_type"], :name => "index_attachments_on_f_a_a", :unique => true

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

  create_table "galleries", :force => true do |t|
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

  create_table "photos", :force => true do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["photoable_id"], :name => "index_photos_on_photoable_id"
  add_index "photos", ["photoable_type"], :name => "index_photos_on_photoable_type"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "tags"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promoted"
    t.boolean  "published"
  end

  create_table "presentations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "link"
    t.string   "speaker_name"
    t.string   "speaker_link"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentations", ["event_id"], :name => "index_presentations_on_event_id"
  add_index "presentations", ["user_id"], :name => "index_presentations_on_user_id"

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

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

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
