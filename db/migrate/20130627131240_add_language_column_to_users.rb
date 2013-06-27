class AddLanguageColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :language, :string, null: false
  end
end
