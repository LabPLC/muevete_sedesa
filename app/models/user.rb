class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followed_actions, through: :relationships, source: :action
  has_many :friend_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :friend_relationships, source: :followed
  has_many :reverse_friend_relationships, foreign_key: "followed_id",
                                          class_name: "FriendRelationship",
                                          dependent: :destroy
  has_many :followers, through: :reverse_friend_relationships, source: :follower
  has_many :badge_relationships, foreign_key: "user_id", dependent: :destroy
  before_update :check_points

  def doing_action?(accion)
    relationships.find_by(action_id: accion.id)
  end

  def do_action!(accion)
    relationships.create(action_id: accion.id)
  end

  def completed_actions
    relationships.where(completed: true)
  end

  def todo_actions
    relationships.where(completed: false)
  end

  def complete_action!(accion)
    if !doing_action?(accion).nil?
      if accion.recurrente
        completada = relationships.find_by(action_id: accion.id)
        completada.completed = false
        completada.save
        add_points(accion)
      else
        completada = relationships.find_by(action_id: accion.id)
        completada.completed = true
        completada.save
        add_points(accion)
      end
    end
  end


  def following?(other_user)
    friend_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    friend_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    friend_relationships.find_by(followed_id: other_user).destroy
  end

  def has_badge?(badge)
    badge_relationships.find_by(badge_id: badge.id)
  end

  def add_badge!(badge)
    badge_relationships.create!(badge_id: badge.id)
  end

  def badges
    badge_relationships
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid ).first
    puts "aa"
    puts user
    if user
      user.access_token_fb = auth.credentials.token
      puts auth.credentials.token
      user.save
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        registered_user.access_token_fb = auth.credentials.token
        puts auth.credentials.token
        registered_user.save
        return registered_user
      else
        user = User.create(first_name: auth.extra.raw_info.first_name,
                                        last_name: auth.extra.raw_info.last_name,
                                        provider: auth.provider,
                                        uid: auth.uid,
                                        email: auth.info.email,
                                        password: Devise.friendly_token[0,20],
                                        access_token_fb: auth.credentials.token)
        puts auth.credentials.token
        return user
      end
    end

  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(first_name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      user.access_token_tw = auth.credentials.token
      puts auth.credentials.token
      user.save
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        user.access_token_tw = auth.credentials.token
        puts auth.credentials.token
        user.save
        return registered_user
      else
        user = User.create(first_name:auth.info.name,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.uid+"@twitter.com",
          password:Devise.friendly_token[0,20],
          access_token_tw: auth.credentials.token
        )
      end
    end
  end

  private
    def add_points(accion)
      self.points += accion.points
      self.save
    end

    def check_points
      #puts "AFTER 100 POINTS" if points > 100
      puts "POINTS POINTS"
    end

end
