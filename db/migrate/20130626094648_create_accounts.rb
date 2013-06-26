class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.integer :credits, null: false, default: 0
    end

    create_table :accounts do |t|
      t.string :name, null: false
      t.string :timezone, null: false
      t.belongs_to :language, null: false
      t.belongs_to :user, null: false


      t.timestamps
    end

    add_index :accounts, :language_id
    add_index :accounts, :user_id

  end
end
