# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  accion_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  completed  :boolean          default(FALSE)
#

class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :accion, class_name: "Accion"
  validates :accion_id, presence: true
  validates :user_id, presence: true
end
