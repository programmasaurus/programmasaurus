class Synset < ActiveRecord::Base
  has_many :hyponym_relations, foreign_key: :synset_id, class_name: "Hyponym"
  has_many :hypernym_relations, foreign_key: :hyponym_id, class_name: "Hyponym"

  has_many :hyponyms, through: :hyponym_relations
  has_many :hypernyms, through: :hypernym_relations
end
