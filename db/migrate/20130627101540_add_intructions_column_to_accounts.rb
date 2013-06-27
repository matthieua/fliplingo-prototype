class AddIntructionsColumnToAccounts < ActiveRecord::Migration
  def change
    add_column :flips, :instructions, :text
  end
end
