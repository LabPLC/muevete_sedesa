class Badge < ActiveRecord::Base

  has_many :user_relationships, foreign_key: "badge_id", dependent: :destroy
end
