class UsersController < ApplicationController
  before_action :set_user, only:  [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def home
    # @acciones = Action.all
    @acciones = Action.all.sample(3)
  end

  def following
    @title = "Siguiendo"
    @user = User.find(params[:user_id])
    ## TODO paginar
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Seguidores"
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'show_follow'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
