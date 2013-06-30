class RenameTranslationColumn < ActiveRecord::Migration
  def change
    rename_column :translations, :translation, :content
    change_column :translations, :content, :string, :null => true
  end
end
