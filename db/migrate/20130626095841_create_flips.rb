class CreateFlips < ActiveRecord::Migration
  def change
    create_table :flips do |t|
      t.integer :from, null: false
      t.integer :to, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
