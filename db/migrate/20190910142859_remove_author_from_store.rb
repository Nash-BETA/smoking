class RemoveAuthorFromStore < ActiveRecord::Migration[5.2]
  def change
    remove_column :stores, :dinner, :string
    remove_column :stores, :lunch, :string
  end
end
