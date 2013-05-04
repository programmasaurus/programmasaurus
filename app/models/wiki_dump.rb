require 'open-uri'

class WikiDump < Struct.new(:synset)
  def create_suggestions!
    synset.words.each do |word|
      dest_synsets = WordCrawl.new(word).synsets
      p dest_synsets.map(&:words)
      dest_synsets.each do |dest_synset|
        Suggestion.create!(
          source_synset_id: synset.synset_id,
          dest_synset_id:   dest_synset.synset_id
        )
      end
    end
  end
end

class WordCrawl < Struct.new(:word)
  def doc
    @doc ||= Nokogiri::HTML(open(source_url))
  end

  def wikified_word
    word.titleize.gsub(/\s+/, '_')
  end

  def source_url
    "http://en.wikipedia.org/wiki/#{wikified_word}"
  end

  def links
    doc.css('#mw-content-text').css('a').map do |a|
      a.attribute('href').value
    end
  end

  def wiki_words
    links.select do |url|
      url =~ %r(^/wiki/\w+$)
    end.map do |url|
      url.gsub(%r(^/wiki/), '').gsub('_', ' ').downcase
    end.uniq
  end

  def synsets
    @synsets ||= wiki_words.map do |word|
      print '.'
      homographs = Wordnet.instance.find(word)
      homographs.senses.first if homographs
    end.compact
  end
end
