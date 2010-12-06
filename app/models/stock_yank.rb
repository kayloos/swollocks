# == Schema Information
# Schema version: 20101118224821
#
# Table name: stock_yanks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  pname      :string(255)
#

require 'yahoo_stock'
class StockYank < ActiveRecord::Base
  has_many :stocks

  def self.get_all_stocks
    symbols = Array.new
    StockYank.all(:limit => 200).each do |sy|
      symbols << sy.name
    end
    YahooStock::Quote.new(:stock_symbols => symbols,
                          :read_parameters => [:name, :symbol, :last_trade_price_only,
                                               :change, :change_in_percent,:ask, :bid, 
                                               :day_low, :day_high, :volume]).results(:to_hash).output
  end

  def self.get_stocks(symbols)
    YahooStock::Quote.new(:stock_symbols => symbols,
                          :read_parameters => [:name, :symbol, :last_trade_price_only,
                                               :change, :change_in_percent,:ask, :bid, 
                                               :day_low, :day_high, :volume]).results(:to_hash).output
  end
end
