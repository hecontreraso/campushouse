class CreateUniversityResidences < ActiveRecord::Migration
  def change
    create_table :university_residences do |t|
    	t.references :university
    	t.references :residence
      t.timestamps null: false
    end
  end
end
