class Badge < ActiveRecord::Base

  has_many :badge_relationships, foreign_key: "badge_id", dependent: :destroy
end
