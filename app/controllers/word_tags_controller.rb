class WordTagsController < ApplicationController
  before_filter :require_user!

  def create
    synset = Synset.from_id(params[:id])
    word = synset.word_for(current_user)
    current_user.tag(word, with: params[:tag], on: :vocabularies)

    redirect_to :back
  end
end
