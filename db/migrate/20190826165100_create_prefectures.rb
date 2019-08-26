class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.integer :prefcode
      t.string :prefname

      t.timestamps
    end
  end
end
