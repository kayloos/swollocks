# == Schema Information
# Schema version: 20101209224750
#
# Table name: notes
#
#  id         :integer         not null, primary key
#  body       :text
#  trade_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Note < ActiveRecord::Base
  belongs_to :trade
end
