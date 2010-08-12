class AddIndexesToForeignKeys < ActiveRecord::Migration
  def self.up
    add_index :stock_yanks, :stock_id
    add_index :stocks, :stock_id
    add_index :stocks, :list_id
    add_index :lists, :user_id
  end

  def self.down
    remove_index :stock_yanks, :stock_id
    remove_index :stocks, :stock_id
    remove_index :stocks, :list_id
    remove_index :lists, :user_id
  end
end
