class AddUserIdToTrades < ActiveRecord::Migration
  def self.up
    add_column :notes, :user_id, :integer
    add_column :trades, :user_id, :integer
  end

  def self.down
    remove_column :notes, :user_id
    remove_column :trades, :user_id
  end
end
