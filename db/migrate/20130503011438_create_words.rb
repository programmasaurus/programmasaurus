class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :synset_id
      t.belongs_to :vocabulary, index: true

      t.timestamps
    end
  end
end
