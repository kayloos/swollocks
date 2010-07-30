class MakeStockYanksDataDecimal < ActiveRecord::Migration
 def self.up
    change_column :stock_yanks, :latest, :decimal
    change_column :stock_yanks, :low, :decimal
    change_column :stock_yanks, :high, :decimal
    change_column :stock_yanks, :turnover, :decimal
  end

  def self.down
    change_column :stock_yanks, :latest, :integer
    change_column :stock_yanks, :low, :integer
    change_column :stock_yanks, :high, :integer
    change_column :stock_yanks, :turnover, :integer
  end

end
