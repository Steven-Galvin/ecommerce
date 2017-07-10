class UpdateUsersWithAdmin < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :account_id, :integer
    add_column :users, :admin, :boolean, :default => false

  end
end
