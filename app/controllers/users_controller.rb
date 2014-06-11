class UsersController < ApplicationController
  before_action :set_user, only:  [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def first_login
  end

  def show
  end

  def home
    # @acciones = Action.all
    @acciones = Accion.order('created_at DESC').limit(6)
  end

  def todo_actions
  end

  def done_actions
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
