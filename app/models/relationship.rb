class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :action, class_name: "Action"
  validates :action_id, presence: true
  validates :user_id, presence: true
end
