# == Schema Information
# Schema version: 20100726014541
#
# Table name: stock_yanks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  low        :string(255)
#  high       :string(255)
#  latest     :string(255)
#  turnover   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class StockYank < ActiveRecord::Base
end
