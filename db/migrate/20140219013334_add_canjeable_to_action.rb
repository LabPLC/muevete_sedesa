class AddCanjeableToAction < ActiveRecord::Migration
  def change
    add_column :actions, :canjeable, :boolean, default: false
  end
end
