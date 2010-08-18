class ColumnTurnoverToBigint < ActiveRecord::Migration
  def self.up
    change_column :stock_yanks, :turnover, :integer, :limit => 7
  end

  def self.down
    change_column :stock_yanks, :turnover, :integer
  end
end
