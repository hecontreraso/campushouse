class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.references :student, index: true, foreign_key: true
      t.references :residence, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
