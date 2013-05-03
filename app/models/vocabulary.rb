class Vocabulary < ActiveRecord::Base
  belongs_to :user
  has_many :words

  scope :for_lemma, ->(synset_id, lemma) do
    words = Word.for_lemma(synset_id, lemma)
    includes(:words).where(words: {id: words})
  end
end
