# == Schema Information
# Schema version: 20101209180628
#
# Table name: stocks
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  portfolio_id  :integer
#  stock_yank_id :integer
#  amount        :integer
#  traded_at     :decimal(, )
#

class Stock < ActiveRecord::Base
  belongs_to  :portfolio
  belongs_to  :stock_yank
  validates_presence_of :stock_yank_id, :portfolio_id, :amount, :traded_at
  attr_accessible       :stock_yank_id, :portfolio_id, :amount, :traded_at

  def value(quotes)
    latest(quotes) * amount
  end

  def latest(quotes)
    stock_quote(quotes)[:last_trade_price_only].to_f
  end

  def stock_quote(quotes)
    sy = stock_yank
    q = quotes[sy.symbol]
    return q
  end

  def earned(quotes)
    value(quotes) - traded_at * amount
  end

  def percent(quotes)
    ((value(quotes) / (traded_at * amount) - 1 )*100)
  end
end
