class BadgeRelationship < ActiveRecord::Base
  belongs_to :badge
  belongs_to :user

  validates :badge_id, presence: true
  validates :user_id, presence: true
end
