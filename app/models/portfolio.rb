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
  validates_length_of   :name, :within => 4..50
  attr_accessible       :name, :deliver_mail
end
