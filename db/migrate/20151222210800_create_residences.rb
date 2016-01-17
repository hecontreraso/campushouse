class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.string :name
      t.string :address, null: false
      t.decimal :price, :precision => 7, :scale => 0, null: false
      t.integer :square_meters
      t.text :description
      t.integer :rooms
      t.references :user, index: true, foreign_key: true
      t.boolean :archived, default: false
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.references :city

      t.timestamps null: false
    end
  end
end
