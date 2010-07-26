class List < ActiveRecord::Base
  belongs_to :user

  has_many :stock
  validates_length_of   :name, :within => 4..50
  attr_accessible       :name

end
