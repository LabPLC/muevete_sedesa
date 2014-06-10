class AddDatesToAcciones < ActiveRecord::Migration
  def change
    add_column :acciones, :fecha_inicio, :date
    add_column :acciones, :fecha_fin, :date
    add_column :acciones, :hora_inicio, :time
    add_column :acciones, :hora_fin, :time
  end
end
