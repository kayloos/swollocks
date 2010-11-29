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
  validates_presence_of :stock_yank_id, :portfolio_id, :amount, :traded_at
  attr_accessible       :stock_yank_id, :portfolio_id, :amount, :traded_at
end
