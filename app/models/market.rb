# == Schema Information
# Schema version: 20101209224750
#
# Table name: markets
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Market < ActiveRecord::Base
end
