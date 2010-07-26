class StockRenameUserId < ActiveRecord::Migration
  def self.up
    rename_column   :stocks, :user_id, :list_id
  end

  def self.down
    rename_column   :stocks, :list_id, :user_id
  end
end
