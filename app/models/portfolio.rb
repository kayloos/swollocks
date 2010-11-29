# == Schema Information
# Schema version: 20101118224821
#
# Table name: portfolios
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  deliver_mail :boolean
#

class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  validates     :name,          :presence  => true,
                                :length    => { :within => 3..30 }

  validates     :start_amount,  :presence  => true,
                                :numericality => true
  attr_accessible       :name, :start_amount, :current_amount, :deliver_mail

  def get_value
    symbols = Array.new
    amounts = Array.new
    stocks.each do |s|
      symbols << StockYank.find(s.stock_yank_id).name
      amounts << s.amount
    end
    quotes = StockYank.get_stocks(symbols)
    value = 0
    quotes.each_with_index do |q, index|
      value += q[:last_trade_price_only].to_f * amounts[index]
    end
    value
  end
end
