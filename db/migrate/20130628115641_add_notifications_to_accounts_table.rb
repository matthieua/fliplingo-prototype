class AddNotificationsToAccountsTable < ActiveRecord::Migration
  def change
    add_column :accounts, :notifications, :integer, null: false, default: 0
  end
end
