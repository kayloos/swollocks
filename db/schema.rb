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

ActiveRecord::Schema.define(:version => 20110210212146) do

  create_table "markets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.text     "body"
    t.integer  "trade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "notes", ["trade_id"], :name => "index_notes_on_trade_id"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "portfolios", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deliver_mail"
    t.decimal  "start_amount",   :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "current_amount", :precision => 8, :scale => 2, :default => 0.0
  end

  add_index "portfolios", ["user_id"], :name => "index_lists_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "stock_yanks", :force => true do |t|
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "market_id",  :default => 1
  end

  add_index "stock_yanks", ["market_id"], :name => "index_stock_yanks_on_market_id"

  create_table "stocks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
    t.integer  "stock_yank_id"
    t.integer  "amount"
    t.decimal  "traded_at",     :precision => 8, :scale => 2, :default => 0.0
  end

  add_index "stocks", ["portfolio_id"], :name => "index_stocks_on_list_id"
  add_index "stocks", ["stock_yank_id"], :name => "index_stocks_on_stock_id"

  create_table "trades", :force => true do |t|
    t.text     "description"
    t.string   "action"
    t.string   "portfolio_name"
    t.string   "stock_name"
    t.decimal  "traded_at",      :precision => 8,  :scale => 2, :default => 0.0
    t.decimal  "amount",         :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "trades", ["portfolio_name"], :name => "index_trades_on_portfolio_name"
  add_index "trades", ["user_id"], :name => "index_trades_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "yank_proposals", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "market_id",  :default => 1
  end

end
