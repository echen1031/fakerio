class AddCreditsInCentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credits_in_cents, :integer, default: 0
  end
end
