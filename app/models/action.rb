class Action < ActiveRecord::Base
  validates :points, presence: true

  has_many :relationships, foreign_key: "action_id", dependent: :destroy
  has_many :users, through: :relationships, source: :user

  validates :code, :presence => true,
                   :if       => :code_valid?

  before_validation :check_code

  rails_admin do
  end

  private
    def code_valid?
      !code.nil? if canjeable
    end

    def check_code
      self.code = nil if !canjeable
    end
end
