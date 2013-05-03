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
end
