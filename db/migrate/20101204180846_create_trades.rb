class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.text :description
      t.string :action
      t.integer :stock_id
      t.decimal :traded_at
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
