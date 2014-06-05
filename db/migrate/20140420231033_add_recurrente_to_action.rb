class AddRecurrenteToAction < ActiveRecord::Migration
  def change
    add_column :acciones, :lugar, :string
    add_column :acciones, :promotor, :string
    add_column :acciones, :recurrente, :boolean
    add_column :acciones, :fecha, :string
    add_column :acciones, :horario, :string
  end
end
