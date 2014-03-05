class AddImageUrlToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :url, :string
  end
end
