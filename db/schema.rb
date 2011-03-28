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

ActiveRecord::Schema.define(:version => 20110327222448) do

  create_table "business_forms", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "Business_Name"
    t.string   "Address_Line_1"
    t.string   "Address_Line_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "local_notices"
    t.string   "website"
    t.string   "phone_number"
    t.string   "business_category"
    t.string   "business_subcategory"
    t.boolean  "signed_in"
    t.string   "more_about_your_business"
    t.integer  "access_count"
    t.string   "user_login"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businessforms", :force => true do |t|
    t.string   "user_login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "local_notices"
    t.string   "website"
    t.string   "phone_number"
    t.string   "business_category"
    t.string   "business_subcategory"
    t.boolean  "signed_in"
    t.text     "more_about_your_business"
    t.integer  "access_count"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_searches", :force => true do |t|
    t.string   "search_city"
    t.string   "search_state"
    t.string   "search_country"
    t.string   "search_zipcode"
    t.string   "search_proximity"
    t.string   "search_units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", :force => true do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.float    "lat"
    t.float    "lng"
    t.string   "angel_business_name"
    t.string   "angel_business_website"
    t.string   "support_summary"
    t.string   "angel_business_type"
    t.string   "qualified_organization_type"
    t.string   "qualified_organization_name"
    t.string   "angel_discription_zoom_zero_ab"
    t.string   "angel_discription_zoom_zero_qo"
    t.datetime "cause_start_date"
    t.datetime "cause_end_date"
    t.text     "angel_full_discription_zoom_one"
    t.integer  "angel_business_id"
    t.string   "coupon_category"
    t.string   "coupon_subcategory"
    t.integer  "will_you_support"
    t.integer  "times_viewed"
    t.string   "curr_ip"
    t.string   "last_ip"
    t.text     "all_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "coupon_owner"
  end

  create_table "foocancans", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simplealerts", :force => true do |t|
    t.string   "email"
    t.string   "location"
    t.string   "location_zip"
    t.integer  "view_count"
    t.integer  "sent_count"
    t.string   "alert_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activealert",  :default => true
    t.string   "secrettoken"
  end

  create_table "single_alerts", :force => true do |t|
    t.string   "email"
    t.string   "location"
    t.integer  "view_count"
    t.integer  "sent_count"
    t.integer  "potential_user_id"
    t.string   "misc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                               :default => false
    t.integer  "business_identifier",                 :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
