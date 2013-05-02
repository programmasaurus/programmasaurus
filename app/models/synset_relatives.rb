class SynsetRelatives < Struct.new(:synset)
  def build_hyponyms!
    wordnet_hyponyms.each do |wordnet_hyponym|
      hyponym = SynsetBuilder.create(synset_id: wordnet_hyponym.synset_id)
      synset.hyponyms << hyponym
    end

    synset.save!
  end

  def wordnet_synset
    @wordnet_synset ||= Wordnet.instance.find_by_synset_id(synset.synset_id)
  end

  def wordnet_hyponyms
    wordnet_synset.hyponyms.map(&:destination)
  end
end
