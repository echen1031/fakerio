class AddAuthenticationTokenAndUuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_column :users, :uuid, :string
  end
end
