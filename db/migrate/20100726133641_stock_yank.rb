class StockYank < ActiveRecord::Migration
  def self.up
    add_column :stock_yanks, :stock_id, :integer
    change_column :stock_yanks, :latest, :integer
    change_column :stock_yanks, :low, :integer
    change_column :stock_yanks, :high, :integer
    change_column :stock_yanks, :turnover, :integer
  end

  def self.down
    remove_column :stock_yanks, :stock_id
    change_column :stock_yanks, :latest, :string
    change_column :stock_yanks, :low, :string
    change_column :stock_yanks, :high, :string
    change_column :stock_yanks, :turnover, :string
  end
end
