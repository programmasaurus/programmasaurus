class WordsController < ApplicationController

  def create
    @vocabulary = current_user.vocabularies.find(params[:vocabulary_id])
    @lemma = params[:lemma]
    @synset = Synset.from_id(params[:synset_id])

    @word = @vocabulary.words.create!(lemma: @lemma, synset_id: @synset.id)

    redirect_to :back
  end

  def destroy
    @word = current_user.words.find(params[:id])
    @word.destroy!

    redirect_to :back
  end

end
