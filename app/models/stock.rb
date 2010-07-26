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

  validates_presence_of :name, :list_id
  validates_length_of   :name, :within => 4..50
  attr_accessible       :name, :list_id
end
