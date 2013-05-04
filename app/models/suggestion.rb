class Suggestion < ActiveRecord::Base
  def destination
    Synset.from_id(dest_synset_id)
  end
end
