class RemodelStockYanks < ActiveRecord::Migration
  def self.up
    remove_column :stock_yanks, :low
    remove_column :stock_yanks, :high
    remove_column :stock_yanks, :latest
    remove_column :stock_yanks, :turnover
    StockYank.delete_all
  end

  def self.down
    add_column :stock_yanks, :low, :decimal
    add_column :stock_yanks, :high, :decimal
    add_column :stock_yanks, :latest, :decimal
    add_column :stock_yanks, :turnover, :integer, :limit => 7
  end
end
