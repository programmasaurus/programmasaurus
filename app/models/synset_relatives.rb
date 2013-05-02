class SynsetRelatives < Struct.new(:synset)
  def build_hyponyms!
    wordnet_hyponyms.each do |wordnet_hyponym|
      hyponym = SynsetBuilder.create(synset_id: wordnet_hyponym.synset_id)
      synset.hyponyms << hyponym
    end

    synset.save!
  end

  def build_hypernyms!
    wordnet_hypernyms.each do |wordnet_hypernym|
      hypernym = SynsetBuilder.create(synset_id: wordnet_hypernym.synset_id)
      synset.hypernyms << hypernym
    end

    synset.save!
  end

  def wordnet_synset
    @wordnet_synset ||= Wordnet.instance.find_by_synset_id(synset.synset_id)
  end

  def wordnet_hyponyms
    wordnet_synset.hyponyms.map(&:destination)
  end

  def wordnet_hypernyms
    wordnet_synset.hypernyms.map(&:destination)
  end
end
