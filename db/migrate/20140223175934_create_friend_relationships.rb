class CreateFriendRelationships < ActiveRecord::Migration
  def change
    create_table :friend_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :friend_relationships, :follower_id
    add_index :friend_relationships, :followed_id
    add_index :friend_relationships, [:follower_id, :followed_id], unique: true
  end
end
