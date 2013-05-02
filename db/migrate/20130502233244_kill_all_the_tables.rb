class KillAllTheTables < ActiveRecord::Migration
  def change
    drop_table :synsets
    drop_table :homographs
    drop_table :hyponyms
  end
end
