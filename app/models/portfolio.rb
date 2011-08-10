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
  has_many :stocks, :include => :stock_yank
  validates     :name,          :presence  => true,
                                :length    => { :within => 3..30 }

  validates     :start_amount,  :presence  => true,
                                :numericality => true,
                                :inclusion => 5000..1000000

  attr_accessible       :name, :start_amount, :current_amount, :deliver_mail

  def stock_value(quotes)
    value = 0
    stocks.each do |s|
      sy = s.stock_yank
      value += s.value(quotes)
    end

    return value
  end

  def total_value(quotes)
    return (current_amount + stock_value(quotes))
  end

  def difference(quotes)
    return (total_value(quotes) - start_amount)
  end
end
