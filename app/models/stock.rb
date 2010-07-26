class Stock < ActiveRecord::Base
  belongs_to  :list

  validates_presence_of :name, :list_id
  validates_length_of   :name, :within => 4..50
  attr_accessible       :name, :list_id
end
