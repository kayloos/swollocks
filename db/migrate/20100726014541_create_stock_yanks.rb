class CreateStockYanks < ActiveRecord::Migration
  def self.up
    create_table :stock_yanks do |t|
      t.string :name
      t.string :low
      t.string :high
      t.string :latest
      t.string :turnover

      t.timestamps
    end
  end

  def self.down
    drop_table :stock_yanks
  end
end
