class AddAuthorizationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authorization_token, :string
  end
end
