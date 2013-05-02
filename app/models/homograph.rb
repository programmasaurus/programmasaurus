class Homograph
  def self.lookup(word)
    self.new(wordnet_homographs: Wordnet.instance.find(word))
  end

  def senses
    @wordnet_homographs.senses
  end

  def initialize(wordnet_homographs: nil)
    @wordnet_homographs = wordnet_homographs
  end
end
