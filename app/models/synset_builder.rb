class SynsetBuilder
  def self.create(synset_id: nil, homograph: nil)
    wordnet_synset = Wordnet.instance.find_by_synset_id(synset_id)

    synset = Synset.where(
      gloss: wordnet_synset.gloss,
      part_of_speech: wordnet_synset.synset_type.to_s,
      synset_id: wordnet_synset.synset_id,
    ).first_or_initialize


    if homograph.present?
      synset.save!
      synset.update_attributes!(homograph_id: homograph.id)
    end

    synset
  end
end
