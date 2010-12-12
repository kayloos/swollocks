class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.text :description
      t.string :action
      t.string :portfolio_name
      t.string :stock_name
      t.decimal :traded_at, :default => 0, :precision => 8, :scale => 2
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
