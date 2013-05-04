class LemmasController < ApplicationController
  before_filter :require_user!

  def show
    @synset = Synset.from_id(params[:id])
    @lemma = params[:lemma]
    @word = Word.new(lemma: @lemma, synset_id: @synset.id)
  end

end
