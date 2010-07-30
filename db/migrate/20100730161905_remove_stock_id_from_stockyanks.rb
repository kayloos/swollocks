class RemoveStockIdFromStockyanks < ActiveRecord::Migration
  def self.up
    remove_column :stock_yanks, :stock_id
    remove_index :stock_yanks, :stock_id
  end

  def self.down
    add_column :stock_yanks, :stock_id, :integer
    add_index :stock_yanks, :stock_id
  end
end
