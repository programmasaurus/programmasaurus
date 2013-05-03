class Synset < Struct.new(:wordnet_synset)
  delegate :gloss, to: :wordnet_synset
  delegate :words, to: :wordnet_synset

  def self.from_id(synset_id)
    Synset.new(Wordnet.instance.find_by_synset_id(synset_id))
  end

  def id
    wordnet_synset.synset_id
  end

  def part_of_speech
    wordnet_synset.synset_type
  end

  def abbreviation
    first_letter = part_of_speech.to_s[0]
    "(#{first_letter}.)"
  end

  def hyponyms
    unless @hyponyms.present?
      wordnet_hyponyms = wordnet_synset.hyponyms.map(&:destination)
      @hyponyms = wordnet_hyponyms.map { |hyponym| Synset.new(hyponym) }
    end

    @hyponyms
  end

  def hypernyms
    unless @hypernyms.present?
      wordnet_hypernyms = wordnet_synset.hypernyms.map(&:destination)
      @hypernyms = wordnet_hypernyms.map { |hypernym| Synset.new(hypernym) }
    end

    @hypernyms
  end

  def sister_words
    hypernyms.map(&:hyponyms).flatten
  end
end
