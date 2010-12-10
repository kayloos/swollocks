# == Schema Information
# Schema version: 20101209180628
#
# Table name: portfolios
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  deliver_mail   :boolean
#  start_amount   :decimal(, )
#  current_amount :decimal(, )
#

class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  validates     :name,          :presence  => true,
                                :length    => { :within => 3..30 }

  validates     :start_amount,  :presence  => true,
                                :numericality => true,
                                :inclusion => 5000..1000000

  attr_accessible       :name, :start_amount, :current_amount, :deliver_mail

  def get_value(quotes=nil)
    unless quotes
      quotes = StockYank.get_all_stocks
    end
    value = 0
    stocks.each do |s|
      sy = s.stock_yank
      value += quotes[sy.symbol][:last_trade_price_only].to_f * s.amount
    end

    return value.round(2)
  end
end
