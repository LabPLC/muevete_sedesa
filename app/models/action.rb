class Action < ActiveRecord::Base
  validates :points, presence: true

  has_many :relationships, foreign_key: "action_id", dependent: :destroy
  has_many :users, through: :relationships, source: :user
end
