class CreateOldvotes < ActiveRecord::Migration
  def change
    create_table :oldvotes do |t|
      t.references :person, index: true
      t.references :user, index: true
      t.integer :points

      t.timestamps
    end
    add_index :oldvotes, :points
    add_index :oldvotes, [:person_id, :user_id], unique: true
  end
end
