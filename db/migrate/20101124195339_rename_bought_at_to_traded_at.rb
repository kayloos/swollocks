class RenameBoughtAtToTradedAt < ActiveRecord::Migration
  def self.up
    rename_column :stocks, :bought_at, :traded_at
  end

  def self.down
    rename_column :stocks, :traded_at, :bought_at
  end
end
