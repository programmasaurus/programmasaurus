class Hyponym < ActiveRecord::Base
  belongs_to :hypernym, foreign_key: :synset_id, class_name: "Synset"
  belongs_to :hyponym, foreign_key: :hyponym_id, class_name: "Synset"
end
