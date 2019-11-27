class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user,  foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :store_id]
  end
end
