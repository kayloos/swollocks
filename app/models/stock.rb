class Stock < ActiveRecord::Base
  belongs_to  :user

  validates_presence_of :user_id
  validates_length_of   :name, :within => 4..50
end
