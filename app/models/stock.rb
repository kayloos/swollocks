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

  def buy(quotes, new_amount)
    new_value = calculate_new_value(new_amount.to_f, latest(quotes).to_f)
    portfolio_amount = portfolio.current_amount.to_f - (new_amount.to_f * latest(quotes).to_f)

    raise Exception "Cannot buy more stock than you have money for in the portfolio" if portfolio_amount < 0.0

    portfolio.update_attributes(:current_amount => portfolio_amount)
    update_attributes(:amount => amount + new_amount, :traded_at => new_value.to_f)
  end

  def sell(quotes, new_amount)
    portfolio.update_attributes(:current_amount => portfolio.current_amount.to_f + (new_amount.to_f * latest(quotes).to_f))

    if new_amount == amount
      destroy
    elsif new_amount > amount
      raise Exception "Cannot sell more stock than you own"
    else
      update_attributes(:amount => amount - new_amount)
    end
  end

  def value(quotes)
    latest(quotes) * amount
  end

  def latest(quotes)
    stock_quote(quotes)[:last_trade_price_only].to_f
  end

  def ask(quotes)
    stock_quote(quotes)[:ask].to_f
  end

  def bid(quotes)
    stock_quote(quotes)[:bid].to_f
  end

  def change(quotes)
    stock_quote(quotes)[:change]
  end

  def change_in_percent(quotes)
    stock_quote(quotes)[:change_in_percent]
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

  def calculate_new_value(new_amount, new_value)
    total_amount = amount + new_amount
    return ((amount / total_amount)     * traded_at.to_f +
            (new_amount / total_amount) * new_value.to_f)
  end
end
