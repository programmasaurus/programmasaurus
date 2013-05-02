class CreateSynsets < ActiveRecord::Migration
  def change
    create_table :synsets do |t|
      t.string :gloss
      t.string :part_of_speech
      t.string :synset_id

      t.timestamps
    end
  end
end
