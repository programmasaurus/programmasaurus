class Homograph < ActiveRecord::Base
  has_many :synsets

  def self.lookup(lemma)
    persisted_homograph = self.find_by_lemma(lemma)
    if persisted_homograph.present?
      persisted_homograph
    else
      HomographBuilder.create(lemma: lemma)
    end
  end
end
