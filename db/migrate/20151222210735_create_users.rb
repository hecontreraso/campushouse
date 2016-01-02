class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.boolean :owner_enabled, default: false
    	t.references :university
    	t.integer :semester
    	t.string :avatar
      t.timestamps null: false
    end
  end
end
