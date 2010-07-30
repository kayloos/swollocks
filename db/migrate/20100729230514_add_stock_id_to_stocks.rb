class AddStockIdToStocks < ActiveRecord::Migration
  def self.up
    add_column(:stocks, :stock_id, :integer)
  end

  def self.down
    remove_column(:stocks, :stock_id)
  end
end
