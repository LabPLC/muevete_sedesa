class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :action_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :action_id
    add_index :relationships, [:user_id, :action_id], unique: true
  end
end
