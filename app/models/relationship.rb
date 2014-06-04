class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :accion, class_name: "Accion"
  validates :accion_id, presence: true
  validates :user_id, presence: true
end
