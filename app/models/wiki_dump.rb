require 'open-uri'

class WikiDump < Struct.new(:url)
  def doc
    @doc ||= Nokogiri::HTML(open(url))
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
    end
  end

  def synsets
    @synsets ||= wiki_words.map do |word|
      Wordnet.instance.find(word)
    end.compact
  end
end
