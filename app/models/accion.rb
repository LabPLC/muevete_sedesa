# == Schema Information
#
# Table name: acciones
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  points     :integer
#  created_at :datetime
#  updated_at :datetime
#  level      :integer          default(1)
#  canjeable  :boolean          default(FALSE)
#  code       :string(255)
#  lugar      :string(255)
#  promotor   :string(255)
#  recurrente :boolean
#  fecha      :string(255)
#  horario    :string(255)
#  url        :string(255)
#

class Accion< ActiveRecord::Base
  validates :points, presence: true

  has_many :relationships, foreign_key: "accion_id", dependent: :destroy
  has_many :users, through: :relationships, source: :user

  validates :code, :presence => true,
                   :if       => :codigo_valido?

  scope :from_today, lambda {|start_date, end_date| where('fecha_inicio >= ? AND fecha_inicio <= ? OR recurrente == ?', start_date, end_date, "TRUE")}

  #before_ :check_code

  rails_admin do
  end

  private
    def code_valid?
      !code.nil? if canjeable
    end

    def codigo_valido?
      canjeable == true
    end

    def check_code
      self.code = nil if !canjeable
    end
end
