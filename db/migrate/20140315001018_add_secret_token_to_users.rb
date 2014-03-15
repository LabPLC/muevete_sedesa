class AddSecretTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token_fb, :string
    add_column :users, :access_token_tw, :string
    add_column :users, :access_token_gp, :string
  end
end
