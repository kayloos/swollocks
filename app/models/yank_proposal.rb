# == Schema Information
# Schema version: 20101209224750
#
# Table name: yank_proposals
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  symbol     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  market_id  :integer
#

class YankProposal < ActiveRecord::Base
end
