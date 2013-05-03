module SynsetHelper
  def synset_link(source_synset, dest_synset)
    link_to dest_synset.lemmas.join(', '), synset_path(dest_synset.id, previous_id: source_synset.id)
  end
end
