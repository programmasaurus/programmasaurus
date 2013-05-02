require 'spec_helper'

describe SynsetRelatives do
  let (:tooth) { SynsetBuilder.create(synset_id: "n05282746")}

  describe "#build_hyponyms!" do
    it do
      expect {
        SynsetRelatives.new(tooth).build_hyponyms!
      }.to change { tooth.hyponyms.count }.by(14)
    end
  end

  describe "#build_hypernyms!" do
    it do
      expect {
        SynsetRelatives.new(tooth).build_hypernyms!
      }.to change { tooth.hypernyms.count }.by(1)
    end
  end
end
