class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :name_hurigana
      t.string :smoking

      t.timestamps
    end
  end
end
