class AddLevelToAction < ActiveRecord::Migration
  def change
    add_column :actions, :level, :integer, default: 1
  end
end
