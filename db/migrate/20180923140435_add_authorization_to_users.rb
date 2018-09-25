class AddAuthorizationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_superadmin, :boolean
    add_column :users, :is_moderator, :boolean
    add_column :users, :is_customer, :boolean
  end
end
