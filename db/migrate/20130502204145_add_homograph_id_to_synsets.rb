class AddHomographIdToSynsets < ActiveRecord::Migration
  def change
    add_column :synsets, :homograph_id, :integer
  end
end
