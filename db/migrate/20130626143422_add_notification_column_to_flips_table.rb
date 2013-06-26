class AddNotificationColumnToFlipsTable < ActiveRecord::Migration
  def change
    add_column :flips, :notification, :boolean, null: false, default: true
  end
end
