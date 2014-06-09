# == Schema Information
#
# Table name: badge_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  badge_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class BadgeRelationship < ActiveRecord::Base
  belongs_to :badge
  belongs_to :user

  validates :badge_id, presence: true
  validates :user_id, presence: true
end
