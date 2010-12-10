class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :notes, :trade_id
    add_index :notes, :user_id
    add_index :stock_yanks, :market_id
    add_index :trades, :user_id
    add_index :trades, :portfolio_name
  end

  def self.down
    remove_index :notes, :trade_id
    remove_index :notes, :user_id
    remove_index :stock_yanks, :market_id
    remove_index :trades, :user_id
    remove_index :trades, :portfolio_name
  end
end
