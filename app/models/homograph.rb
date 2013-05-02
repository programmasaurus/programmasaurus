class Homograph < ActiveRecord::Base
  def self.lookup(lemma)
    persisted_homograph = self.find_by_lemma(lemma)
    if persisted_homograph.present?
      persisted_homograph
    else
      HomographBuilder.create(lemma)
    end
  end

  def senses
    wordnet_homographs.senses
  end

  def wordnet_homographs
    @wordnet_homographs ||= Wordnet.instance.find(lemma)
  end
end

class HomographBuilder
  def self.create(lemma)
    wordnet_homographs = Wordnet.instance.find(lemma)

    if wordnet_homographs.present?
      Homograph.create!(lemma: lemma)
    end
  end
end
