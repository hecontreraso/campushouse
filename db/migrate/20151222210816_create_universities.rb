class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
    	t.string :name, null: false
    	t.string :search_term, null: false
      t.float :latitude, index: true
      t.float :longitude, index: true

      t.timestamps null: false
    end
  end
end
