class Accion< ActiveRecord::Base
  validates :points, presence: true

  has_many :relationships, foreign_key: "accion_id", dependent: :destroy
  has_many :users, through: :relationships, source: :user

  validates :code, :presence => true,
                   :if       => :codigo_valido?

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
