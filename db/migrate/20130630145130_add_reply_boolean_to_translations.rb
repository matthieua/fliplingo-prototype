class AddReplyBooleanToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :reply, :boolean, null: false, default: false
  end
end
