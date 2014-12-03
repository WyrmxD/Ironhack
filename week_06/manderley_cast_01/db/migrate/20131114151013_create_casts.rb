class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :role
      t.references :person, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
