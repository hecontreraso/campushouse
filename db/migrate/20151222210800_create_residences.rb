class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
    	t.string :name
    	t.decimal :price, :precision => 7, :scale => 0, null: false
    	t.integer :square_meters
      t.text :description    	
    	t.integer :rooms
    	t.references :owner
      t.timestamps null: false
    end
  end
end
