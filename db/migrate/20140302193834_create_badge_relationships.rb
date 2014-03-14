class CreateBadgeRelationships < ActiveRecord::Migration
  def change
    create_table :badge_relationships do |t|
      t.integer :user_id
      t.integer :badge_id

      t.timestamps
    end
    add_index :badge_relationships, :user_id
    add_index :badge_relationships, :badge_id
    add_index :badge_relationships, [:user_id, :badge_id], unique: true
  end
end
