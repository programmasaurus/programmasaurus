class SynsetBuilder
  def self.create(word: nil, synset_id: nil, wordnet_synset: nil)
    # find by word and wordnet ID if a synset object is not provided
    if wordnet_synset.blank?
      wordnet_homographs = Wordnet.instance.find(lemma)
      wordnet_synset = wordnet_homographs.find { |homograph| homograph.synset_id == synset_id }
    end

    wordnet_homographs ||= wordnet_synset.homographs
    homograph = HomographBuilder.create(nil, wordnet_homographs)

    Synset.where(
      gloss: wordnet_synset.gloss,
      part_of_speech: wordnet_synset.synset_type.to_s,
      synset_id: wordnet_synset.synset_id,
      homograph_id: homograph
    ).first_or_create!
  end
end
