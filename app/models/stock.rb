# == Schema Information
# Schema version: 20101118224821
#
# Table name: stocks
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  portfolio_id  :integer
#  stock_yank_id :integer
#

class Stock < ActiveRecord::Base
  belongs_to  :portfolio
  belongs_to  :stock_yank
  validates_presence_of :stock_yank_id, :portfolio_id
  attr_accessible       :stock_yank_id, :portfolio_id

  def self.get_stock
    require 'yahoofinance'
   
    quote_symbols = String.new
    StockYank.all.each do |s|
      quote_symbols += s.name + "," 
    end
    # Set the type of quote we want to retrieve.
    # Available type are:
    #  - YahooFinanace::StandardQuote
    #  - YahooFinanace::ExtendedQuote
    #  - YahooFinanace::RealTimeQuote
    quote_type = YahooFinance::StandardQuote

    # Set the symbols for which we want to retrieve quotes.
    # You can include more than one symbol by separating 
    # them with a ',' (comma).
    # quote_symbols = "yhoo,goog"

    # Get the quotes from Yahoo! Finance.  The get_quotes method call
    # returns a Hash containing one quote object of type "quote_type" for
    # each symbol in "quote_symbols".  If a block is given, it will be
    # called with the quote object (as in the example below).
    # YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
    #     puts "QUOTING: #{qt.symbol}"
    #    puts qt.to_s
    # end

    # You can get the same effect using the quote specific method.
    YahooFinance::get_standard_quotes( quote_symbols )
  end
end
