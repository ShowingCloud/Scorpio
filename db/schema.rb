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

ActiveRecord::Schema.define(:version => 20121122232557) do

  create_table "orders", :force => true do |t|
    t.string   "order_id",                                                                     :null => false
    t.datetime "order_time"
    t.string   "order_channel",                                         :default => "Novasol"
    t.integer  "order_status",                                          :default => 0
    t.integer  "gift_flag"
    t.string   "gift_price"
    t.string   "gift_msg"
    t.string   "del_msg"
    t.string   "mem_id",                                                                       :null => false
    t.string   "mem_name",                                                                     :null => false
    t.string   "mem_email",                                                                    :null => false
    t.integer  "mem_post"
    t.string   "mem_prov"
    t.string   "mem_city"
    t.string   "mem_dist"
    t.string   "mem_addr"
    t.string   "mem_mobile"
    t.string   "mem_phone"
    t.string   "del_name"
    t.integer  "del_post"
    t.string   "del_prov"
    t.string   "del_city"
    t.string   "del_dist"
    t.string   "del_addr"
    t.string   "del_mobile"
    t.string   "del_phone"
    t.integer  "inv_flag"
    t.string   "inv_title"
    t.string   "inv_content"
    t.string   "inv_name"
    t.integer  "inv_post"
    t.string   "inv_prov"
    t.string   "inv_city"
    t.string   "inv_dist"
    t.string   "inv_addr"
    t.string   "inv_mobile"
    t.string   "inv_phone"
    t.text     "detail",                                                                       :null => false
    t.integer  "payment",                                                                      :null => false
    t.decimal  "ship",                    :precision => 5, :scale => 2
    t.decimal  "coupon",                  :precision => 6, :scale => 2, :default => 0.0
    t.integer  "pay_status",                                            :default => 0
    t.date     "pay_date"
    t.integer  "ship_status",                                           :default => 0
    t.string   "ship_sched"
    t.date     "ship_date"
    t.string   "del_company"
    t.string   "del_ship_id"
    t.date     "arrival"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
    t.string   "alipay_cb_buyer_email"
    t.string   "alipay_cb_buyer_id"
    t.string   "alipay_cb_trade_status"
    t.string   "alipay_cb_trade_no"
    t.decimal  "alipay_cb_total_fee",     :precision => 6, :scale => 2
    t.datetime "alipay_cb_notify_time"
    t.decimal  "expected_total_fee",      :precision => 6, :scale => 2, :default => 0.0
    t.datetime "alipay_nt_notify_time"
    t.string   "alipay_nt_trade_no"
    t.string   "alipay_nt_trade_status"
    t.datetime "alipay_nt_create_time"
    t.datetime "alipay_nt_pay_time"
    t.datetime "alipay_nt_close_time"
    t.string   "alipay_nt_refund_status"
    t.datetime "alipay_nt_refund_time"
    t.string   "alipay_nt_buyer_email"
    t.string   "alipay_nt_buyer_id"
    t.decimal  "alipay_nt_total_fee",     :precision => 6, :scale => 2
    t.decimal  "alipay_nt_discount",      :precision => 6, :scale => 2
  end

  add_index "orders", ["mem_id"], :name => "index_orders_on_mem_id"
  add_index "orders", ["order_id"], :name => "index_orders_on_order_id"

  create_table "products", :force => true do |t|
    t.string   "product_name",                               :null => false
    t.string   "product_id",                                 :null => false
    t.string   "product_pic",                                :null => false
    t.text     "name_desc"
    t.text     "gallery"
    t.decimal  "price",        :precision => 6, :scale => 2, :null => false
    t.decimal  "retail",       :precision => 6, :scale => 2, :null => false
    t.string   "price_desc",                                 :null => false
    t.string   "spec"
    t.text     "cert"
    t.text     "desc"
    t.text     "adv"
    t.string   "comp"
    t.string   "usage"
    t.string   "orig"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "products", ["product_id"], :name => "index_products_on_product_id"

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_inquiries_inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "spam",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "refinery_inquiries_inquiries", ["id"], :name => "index_refinery_inquiries_inquiries_on_id"

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_f9716c4215584edbca2557e32706a5ae084a15ef"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_d079468f88bff1c6ea81573a0d019ba8bf5c2902"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     :default => true
    t.string   "scoping"
    t.boolean  "restricted",      :default => false
    t.string   "form_value_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
