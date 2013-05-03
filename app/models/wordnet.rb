class Wordnet
  include Singleton

  def find(word)
    @connection.find(word)
  end

  def find_by_synset_id(synset_id)
    if synset_id.present?
      Words::Synset.new(synset_id, @connection.wordnet_connection, nil)
    end
  end

  def initialize
    @connection = Words::Wordnet.new(:pure, Rails.root.join('data', 'dict'))
  end
end
