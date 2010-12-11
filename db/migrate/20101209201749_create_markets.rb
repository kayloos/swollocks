class CreateMarkets < ActiveRecord::Migration
  def self.up
    create_table :markets do |t|
      t.string :name

      t.timestamps
    end
    Market.create!(:name => "OMX Copenhagen")
  end

  def self.down
    drop_table :markets
  end
end
