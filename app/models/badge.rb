# == Schema Information
#
# Table name: badges
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  points     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Badge < ActiveRecord::Base

  has_many :badge_relationships, foreign_key: "badge_id", dependent: :destroy
end
