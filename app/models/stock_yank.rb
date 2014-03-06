# == Schema Information
# Schema version: 20101209224750
#
# Table name: stock_yanks
#
#  id         :integer         not null, primary key
#  symbol     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  market_id  :integer
#

require 'yahoo_stock'
class StockYank < ActiveRecord::Base
  has_many :stocks

  def self.get_all_stocks
    symbols = Array.new
    StockYank.all(:limit => 200).each do |sy|
      symbols << sy.symbol
    end
    
    if symbols.any?
      return YahooStock::Quote.new(:stock_symbols => symbols,
                                   :read_parameters => [:name, :symbol, :last_trade_price_only,
                                                        :change, :change_in_percent, :ask, :bid, 
                                                        :day_low, :day_high, :volume]).results(:to_hash).output
    else
      return []
    end
  end

  def self.get_stocks(symbols)
    YahooStock::Quote.new(:stock_symbols => symbols,
                          :read_parameters => [:name, :symbol, :last_trade_price_only,
                                               :change, :change_in_percent,:ask, :bid, 
                                               :day_low, :day_high, :volume]).results(:to_hash).output
  end

  def self.get_history(symbol, start_date, end_date)
    YahooStock::History.new(:stock_symbol => symbol,
                            :start_date   => start_date,
                            :end_date     => end_date).results(:to_array).output
  end
end
