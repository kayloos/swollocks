class RenameStockYankNames < ActiveRecord::Migration
  def self.up
    rename_column :stock_yanks, :name, :symbol
    rename_column :stock_yanks, :pname, :name
  end

  def self.down
    rename_column :stock_yanks, :name, :pname
    rename_column :stock_yanks, :symbol, :name
  end
end
