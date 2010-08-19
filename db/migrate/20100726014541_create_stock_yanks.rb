class CreateStockYanks < ActiveRecord::Migration
  def self.up
    create_table :stock_yanks do |t|
      t.integer :stock_id
      t.string :name
      t.decimal :low
      t.decimal :high
      t.decimal :latest
      t.integer :turnover, :limit => 7

      t.timestamps
    end
  end

  def self.down
    drop_table :stock_yanks
  end
end
