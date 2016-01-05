class AddArchivedToResidence < ActiveRecord::Migration
  def change
    add_column :residences, :archived, :boolean, default: false
  end
end
