class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.references :residence
    	t.string :comment
    	t.integer :value, null: false
      t.timestamps null: false
    end
  end
end
