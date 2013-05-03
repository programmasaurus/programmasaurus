module ApplicationHelper
  COLOR_CLASSES = {
    0 => "green-sea",
    1 => "nephritis",
    2 => "belize-hole",
    3 => "wisteria",
    4 => "midnight-blue",
    5 => "orange",
    6 => "pumpkin",
    7 => "pomegranate" }
  
  def color_class(index)
    COLOR_CLASSES[index]
  end

  def lemma_toggle_class(vocabulary, synset, lemma)
    if vocabulary.words.for_lemma(synset.id, lemma).exists?
      ""
    else
      "toggle-off"
    end
  end

  def link_to_lemma_toggle(vocabulary, synset, lemma, &block)
    word = vocabulary.words.for_lemma(synset.id, lemma).first
    if word
      link_to(word_path(word), method: "delete", &block)
    else
      link_to(words_path(vocabulary_id: vocabulary.id, synset_id: synset.id, lemma: lemma), method: "post", &block)
    end
  end

end
