class CreateResidenceFeatures < ActiveRecord::Migration
  def change
    create_table :residence_features do |t|
    	t.references :feature
    	t.references :residence
      t.timestamps null: false
    end
  end
end
