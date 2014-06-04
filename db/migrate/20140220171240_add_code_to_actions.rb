class AddCodeToActions < ActiveRecord::Migration
  def change
    add_column :acciones, :code, :string
  end
end
