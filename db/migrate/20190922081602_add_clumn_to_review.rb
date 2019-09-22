class AddClumnToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :image, :string
  end
end
