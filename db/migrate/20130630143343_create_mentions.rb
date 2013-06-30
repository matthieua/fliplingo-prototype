class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.belongs_to :translation, null: false
      t.string :twitter_handle, null: false
      t.string :name, null: false
      t.integer :reply_to, null: false

      t.timestamps
    end
  end
end
