# == Schema Information
# Schema version: 20100726014541
#
# Table name: lists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
  belongs_to :user

  has_many :stock
  validates_length_of   :name, :within => 4..50
  attr_accessible       :name

end
