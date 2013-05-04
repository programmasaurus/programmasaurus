class Homograph < Struct.new(:wordnet_homographs)
  delegate :lemma, to: :wordnet_homographs

  def self.lookup(lemma)
    self.new(Wordnet.instance.find(lemma))
  end

  def no_data?
    wordnet_homographs.blank?
  end

  def synsets
    return [] if no_data?
    wordnet_homographs.synsets.map do |synset|
      Synset.new(synset)
    end
  end
end
