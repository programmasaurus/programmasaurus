class SynsetsController < ApplicationController
  def show
    @synset = Synset.from_id(params[:id])
    @homograph = Homograph.lookup(params[:origin_lemma])
    @word = Word.new(lemma: params[:origin_lemma], synset_id: @synset.id)
  end
end
