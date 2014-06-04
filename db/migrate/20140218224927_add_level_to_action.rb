class AddLevelToAction < ActiveRecord::Migration
  def change
    add_column :acciones, :level, :integer, default: 1
  end
end
