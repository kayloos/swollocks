class AddPortfolioMoney < ActiveRecord::Migration
  def self.up
    add_column :portfolios, :start_amount, :decimal
    add_column :portfolios, :current_amount, :decimal
    add_column :stocks, :amount, :integer
  end

  def self.down
    remove_column :portfolios, :start_amount
    remove_column :portfolios, :current_amount
    remove_column :stocks, :amount
  end
end
