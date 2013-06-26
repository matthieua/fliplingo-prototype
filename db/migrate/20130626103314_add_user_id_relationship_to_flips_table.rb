class AddUserIdRelationshipToFlipsTable < ActiveRecord::Migration
  def change
    add_column :flips, :user_id, :integer, null: false

    add_index :flips, :user_id
  end
end
