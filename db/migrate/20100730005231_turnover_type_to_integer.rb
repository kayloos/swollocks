class TurnoverTypeToInteger < ActiveRecord::Migration
  def self.up
    change_column :stock_yanks, :turnover, :integer
  end

  def self.down
    change_column :stock_yanks, :turnover, :decimal
  end
end
