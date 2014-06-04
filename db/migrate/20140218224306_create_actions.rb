class CreateActions < ActiveRecord::Migration
  def change
    create_table :acciones do |t|
      t.string :name
      t.text :desc
      t.integer :points

      t.timestamps
    end
  end
end
