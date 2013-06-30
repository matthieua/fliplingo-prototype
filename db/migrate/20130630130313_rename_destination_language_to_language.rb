class RenameDestinationLanguageToLanguage < ActiveRecord::Migration
  def change
    rename_column :translations, :destination_language, :language
    rename_column :translations, :translation_kind, :kind
  end
end
