# == Schema Information
# Schema version: 20100726014541
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  list_id    :integer
#

class Stock < ActiveRecord::Base
  belongs_to  :list
  belongs_to  :stock_yank
  validates_presence_of :stock_yank_id, :list_id
  attr_accessible       :stock_yank_id, :list_id
end
