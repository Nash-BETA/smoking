class AddColumnToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :lunch_min, :integer
    add_column :stores, :lunch_max, :integer
    add_column :stores, :dinner_min, :integer
    add_column :stores, :dinner_max, :integer
  end
end
