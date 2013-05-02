class Wordnet
  include Singleton

  def find(word)
    @connection.find(word)
  end

  def initialize
    @connection = Words::Wordnet.new(:pure, Rails.root.join('data', 'dict'))
  end
end
