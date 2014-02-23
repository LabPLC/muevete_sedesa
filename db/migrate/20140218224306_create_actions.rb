class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.string :desc
      t.integer :points

      t.timestamps
    end
  end
end
