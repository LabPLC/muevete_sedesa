class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.text :desc
      t.integer :points

      t.timestamps
    end
  end
end
