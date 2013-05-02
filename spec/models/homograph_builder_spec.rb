require 'spec_helper'

describe HomographBuilder do
  describe ".create" do
    it "builds from a lemma" do
      homograph = HomographBuilder.create(lemma: "word")

      homograph.should be_persisted
      homograph.lemma.should == "word"
    end

    it "builds synsets" do
      homograph = HomographBuilder.create(lemma: "word")

      homograph.synsets.count.should == 11
    end

    it "builds from a wordnet object" do
      wordnet_homographs = Wordnet.instance.find("word")
      homograph = HomographBuilder.create(lemma: "word")

      homograph.should be_persisted
      homograph.lemma.should == "word"
    end

    context "when a wordnet object cannot be found" do
      it "returns nil" do
        HomographBuilder.create(lemma: "heeblejeebles").should be_nil
      end
    end
  end
end
