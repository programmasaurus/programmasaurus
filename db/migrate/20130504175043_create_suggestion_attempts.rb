class CreateSuggestionAttempts < ActiveRecord::Migration
  def change
    create_table :suggestion_attempts do |t|
      t.string :synset_id

      t.timestamps
    end
  end
end
