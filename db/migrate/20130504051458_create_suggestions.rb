class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :source_synset_id
      t.string :dest_synset_id

      t.timestamps
    end
  end
end
