require 'spec_helper'

describe SynsetBuilder do
  describe '.create' do
    it "builds from a wordnet synset ID" do
      synset = SynsetBuilder.create(synset_id: "n06421016")

      synset.gloss.should     == "a book containing a classified list of synonyms"
      synset.synset_id.should == "n06421016"
    end

    let (:homograph) { Homograph.create!(lemma: "thesaurus") }

    it "adds a link to a homograph if provided" do
      synset = SynsetBuilder.create(synset_id: "n06421016", homograph: homograph)
      synset.homograph_id.should be_present
    end
  end
end
