class AddCodeToActions < ActiveRecord::Migration
  def change
    add_column :actions, :code, :string
  end
end
