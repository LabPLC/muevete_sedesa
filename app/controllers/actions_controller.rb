class ActionsController < ApplicationController
  def show
    @action = Action.find(params[:id])

  end

  def agregar
    @action = Action.find(params[:id])
    if !current_user.nil?
      puts params
      current = current_user.todo_actions.find{|r| r.action_id == @action.id}
      if !current.nil?
        puts "LALALALALA"
        curr_action = Action.find_by(id: current.action_id)
        current_user.complete_action!(curr_action)
        flash[:notice] = "Tarea completada"
      else
        current_user.do_action!(@action)
        flash[:notice] = "Tarea pendiente!"
      end

    end
    redirect_to user_home_path
  end

  def user
    puts current_user.nil?
  end
end
