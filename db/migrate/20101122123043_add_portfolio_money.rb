class AddPortfolioMoney < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :start_amount, :decimal, :default => 0, :precision => 8, :scale => 2
    add_column :portfolios, :current_amount, :decimal, :default => 0, :precision => 8, :scale => 2
    add_column :stocks, :amount, :integer
  end

  def self.down
    remove_column :portfolios, :start_amount
    remove_column :portfolios, :current_amount
    remove_column :stocks, :amount
  end
end
