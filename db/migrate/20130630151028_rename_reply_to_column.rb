class RenameReplyToColumn < ActiveRecord::Migration
  def change
    rename_column :mentions, :reply_to, :reply_id
  end
end
