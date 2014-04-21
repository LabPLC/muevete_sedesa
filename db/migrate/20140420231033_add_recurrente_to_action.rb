class AddRecurrenteToAction < ActiveRecord::Migration
  def change
    add_column :actions, :lugar, :string
    add_column :actions, :promotor, :string
    add_column :actions, :recurrente, :boolean
    add_column :actions, :fecha, :string
    add_column :actions, :horario, :string
  end
end
