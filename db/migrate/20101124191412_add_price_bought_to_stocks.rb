class AddPriceBoughtToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :bought_at, :decimal
  end

  def self.down
    remove_column :stocks, :bought_at
  end
end
