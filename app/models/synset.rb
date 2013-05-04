class Synset < Struct.new(:wordnet_synset)
  delegate :gloss, to: :wordnet_synset

  def lemmas
    wordnet_synset.words
  end

  def suggestions
    Suggestion.where(source_synset_id: id)
  end

  def self.from_id(synset_id)
    Synset.new(Wordnet.instance.find_by_synset_id(synset_id))
  end

  def word_for(vocabulary)
    vocabulary.words.where(synset_id: id).first_or_create
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

  %i[hyponyms hypernyms part_meronyms part_holonyms substance_meronyms substance_holonyms].each do |relative|
    define_method relative do
      ivar = :"@#{relative}"
      unless instance_variable_get(ivar).present?
        relatives = wordnet_synset.send(relative).map(&:destination)
        relatives.map! { |r| Synset.new(r) }
        instance_variable_set(ivar, relatives)
      end

      instance_variable_get(ivar)
    end
  end

  def holonyms
    part_holonyms + substance_holonyms
  end

  def meronyms
    part_meronyms + substance_meronyms
  end

  def sister_words
    hypernyms.map(&:hyponyms).flatten
  end

  def evocations
    if wordnet_synset.evocations.present?
      wordnet_synset.evocations.destinations.map { |destination| Synset.new(destination) }
    else
      []
    end
  end

  def no_data?
    wordnet_synset.blank?
  end

  def word_list
    lemmas.join(', ') unless no_data?
  end
end
