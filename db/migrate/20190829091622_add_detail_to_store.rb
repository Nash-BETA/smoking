class AddDetailToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :prefecture, :string
    add_column :stores, :city, :string
  end
end
