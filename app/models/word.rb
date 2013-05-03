class Word < ActiveRecord::Base
  belongs_to :user
  belongs_to :vocabulary

  scope :for_lemma, ->(synset_id, lemma) { where(synset_id: synset_id, lemma: lemma) }

end
