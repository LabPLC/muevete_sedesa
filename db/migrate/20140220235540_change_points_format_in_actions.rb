class ChangePointsFormatInActions < ActiveRecord::Migration
  def self.up
    change_column :actions, :points, :integer
  end
end
