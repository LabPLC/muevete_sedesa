class AddCompletedToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :completed, :boolean, default: false
  end
end
