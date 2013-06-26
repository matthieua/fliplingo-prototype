class RenameTypeColumnOnFlipTable < ActiveRecord::Migration
  def change
    rename_column :flips, :type, :kind
  end
end
