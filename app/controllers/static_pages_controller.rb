class StaticPagesController < ApplicationController
  before_filter :authenticate_user!
  def index
  end
  
  def ayuda
  end
  
  def info
  end
end
