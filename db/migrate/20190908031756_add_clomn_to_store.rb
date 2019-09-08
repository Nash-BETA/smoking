class AddClomnToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :city_street, :string
    add_column :stores, :genre, :string
    add_column :stores, :business_hours, :string
    add_column :stores, :holiday, :string
    add_column :stores, :dinner, :string
    add_column :stores, :lunch, :string
  end
end
