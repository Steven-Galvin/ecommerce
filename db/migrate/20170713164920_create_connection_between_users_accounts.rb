class CreateConnectionBetweenUsersAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :account_id, :integer
    add_column :accounts, :user_id, :integer
  end
end
