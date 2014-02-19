class ActionsController < ApplicationController
  def show
    @action = Action.find(params[:id])
  end
end
