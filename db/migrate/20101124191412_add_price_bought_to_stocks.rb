class AddPriceBoughtToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :bought_at, :decimal, :default => 0, :precision => 12, :scale => 2
  end

  def self.down
    remove_column :stocks, :bought_at
  end
end
