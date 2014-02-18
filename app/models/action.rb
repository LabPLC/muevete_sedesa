class Action < ActiveRecord::Base
  validates :points, presence: true
end
