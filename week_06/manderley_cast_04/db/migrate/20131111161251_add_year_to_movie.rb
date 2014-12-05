class AddYearToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :year, :Integer
  end
end
