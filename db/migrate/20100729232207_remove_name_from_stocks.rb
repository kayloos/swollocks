class RemoveNameFromStocks < ActiveRecord::Migration
  def self.up
    remove_column :stocks, :name
  end

  def self.down
    add_column :stocks, :name, :string
  end
end
