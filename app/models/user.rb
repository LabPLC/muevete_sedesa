class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followed_actions, through: :relationships, source: :action

  def doing_action?(accion)
    relationships.find_by(action_id: accion.id)
  end

  def do_action!(accion)
    relationships.create!(action_id: accion.id)
  end

  def completed_actions
    relationships.find_all_by_completed(true)
  end

  def todo_actions
    relationships.find_all_by_completed(false)
  end

  def complete_action!(accion)
    if !doing_action?(accion).nil?
      completada = relationships.find(accion)
      completada.completed = true
      completada.save

      add_points(accion)
    end
  end

  def add_points(accion)
    self.points += accion.points
    self.save
  end

end
