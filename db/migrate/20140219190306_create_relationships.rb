class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :accion_id

      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :accion_id
    add_index :relationships, [:user_id, :accion_id], unique: true
  end
end
