class AddPictureToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :image, :string
  end
end
