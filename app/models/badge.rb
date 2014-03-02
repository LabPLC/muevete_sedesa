class Badge < ActiveRecord::Base

  has_many :badge_relationships, foreign_key: "user_id", dependent: :destroy
end
