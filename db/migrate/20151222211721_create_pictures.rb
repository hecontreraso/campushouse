class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture
      t.references :residence
      t.timestamps null: false
    end
  end
end
