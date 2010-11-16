class RenameStocksTableStockColumnToStockYankId < ActiveRecord::Migration
  def self.up
    rename_column :stocks, :stock_id, :stock_yank_id
  end

  def self.down
    rename_column :stocks, :stock_yank_id, :stock_id
  end
end
