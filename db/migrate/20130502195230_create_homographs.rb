class CreateHomographs < ActiveRecord::Migration
  def change
    create_table :homographs do |t|
      t.string :lemma

      t.timestamps
    end
  end
end
