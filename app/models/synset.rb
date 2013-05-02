class Synset < Struct.new(:wordnet_synset)
  delegate :gloss, to: :wordnet_synset

  def part_of_speech
    wordnet_synset.synset_type
  end
end
