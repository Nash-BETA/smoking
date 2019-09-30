class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index favorites , [:user_id,:store_id]
  end
end
