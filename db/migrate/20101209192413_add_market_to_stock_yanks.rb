class AddMarketToStockYanks < ActiveRecord::Migration
  def self.up
    add_column :stock_yanks, :market_id, :integer, :default => 1
    add_column :yank_proposals, :market_id, :integer, :default => 1
    StockYank.all.each do |sy|
      sy.market_id = 1
      sy.save
    end
  end

  def self.down
    remove_column :stock_yanks, :market_id
    remove_column :yank_proposals, :market_id
  end
end
