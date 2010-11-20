class AddPrettyNameStockyanks < ActiveRecord::Migration
  def self.up
    add_column :stock_yanks, :pname, :string
  end

  def self.down
    remove_column :stock_yanks, :pname
  end
end
