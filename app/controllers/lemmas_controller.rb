class LemmasController < ApplicationController

  def show
    @lemma = params[:lemma]
    @synset = Synset.from_id(params[:synset_id])
    @word = Word.new(lemma: @lemma, synset_id: @synset.id)
  end

end
