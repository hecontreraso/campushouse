class CreateSearchPoints < ActiveRecord::Migration
  def change
    create_table :search_points do |t|
      t.string :input, null: false
      t.integer :hits, default: 0
      t.float :latitude, index: true
      t.float :longitude, index: true
      
      t.timestamps null: false
    end
  end
end
