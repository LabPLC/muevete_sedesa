class AddCanjeableToAction < ActiveRecord::Migration
  def change
    add_column :acciones, :canjeable, :boolean, default: false
  end
end
