class AddUrlToActions < ActiveRecord::Migration
  def change
    add_column :acciones, :url, :string
  end
end
