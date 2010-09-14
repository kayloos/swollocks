class AddColumnDeliverMailToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :deliver_mail, :boolean
  end

  def self.down
    remove_column :lists, :deliver_mail
  end
end
