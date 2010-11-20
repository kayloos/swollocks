# == Schema Information
# Schema version: 20101118224821
#
# Table name: stock_yanks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  pname      :string(255)
#

class StockYank < ActiveRecord::Base
  has_many :stocks
  def self.search(search)
    if search
      where('pname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
