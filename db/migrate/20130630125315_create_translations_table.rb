class CreateTranslationsTable < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.belongs_to :account, null: false
      t.string :source, null: false
      t.string :translation, null: false
      t.string :source_language, null: false
      t.string :destination_language, null: false
      t.string :translation_kind, null: false
      t.string :status, null: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
