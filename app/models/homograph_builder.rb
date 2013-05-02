class HomographBuilder
  def self.create(lemma: nil, wordnet_homographs: nil)
    wordnet_homographs ||= Wordnet.instance.find(lemma)
    lemma              ||= wordnet_homographs.lemma

    if wordnet_homographs.present?
      homograph = Homograph.where(lemma: lemma).first_or_initialize

      unless homograph.persisted?
        homograph.save!

        wordnet_homographs.senses.each do |synset|
          SynsetBuilder.create(synset_id: synset.synset_id, homograph: homograph)
        end
      end

      homograph
    end
  end
end
