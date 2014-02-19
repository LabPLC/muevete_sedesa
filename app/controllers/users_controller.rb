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

  private
    def set_user
      @user = User.find(params[:id])
    end
end
