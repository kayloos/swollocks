class RenameListToPortfolio < ActiveRecord::Migration
  def self.up
    rename_table :lists, :portfolios
    rename_column :stocks, :list_id, :portfolio_id
  end

  def self.down
    rename_table :portfolios, :lists 
    rename_column :stocks, :portfolio_id, :list_id
  end
end
