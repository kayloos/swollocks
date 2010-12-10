class CreateYankProposals < ActiveRecord::Migration
  def self.up
    create_table :yank_proposals do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end

  def self.down
    drop_table :yank_proposals
  end
end
