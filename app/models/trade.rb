# == Schema Information
# Schema version: 20101209224750
#
# Table name: trades
#
#  id             :integer         not null, primary key
#  description    :text
#  action         :string(255)
#  portfolio_name :string(255)
#  stock_name     :string(255)
#  traded_at      :decimal(, )
#  amount         :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#

class Trade < ActiveRecord::Base
  has_one :note
end
