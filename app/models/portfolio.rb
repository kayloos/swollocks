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
                                :numericality => true,
                                :inclusion => 5000..1000000

  attr_accessible       :name, :start_amount, :current_amount, :deliver_mail

  def get_value
    quotes = StockYank.get_all_stocks
    value = 0
    stocks.each do |s|
      sy = s.stock_yank
      value += quotes[sy.name][:last_trade_price_only].to_f * s.amount
    end

    return value.round
  end
end
