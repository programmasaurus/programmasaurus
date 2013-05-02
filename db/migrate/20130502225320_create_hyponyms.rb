class CreateHyponyms < ActiveRecord::Migration
  def change
    create_table :hyponyms do |t|
      t.integer :synset_id
      t.integer :hyponym_id

      t.timestamps
    end
  end
end
