class WordTagsController < ApplicationController
  before_filter :require_user!

  def create
    word = Word.find(params[:id])
    current_tags = word.vocabularies_from(current_user)

    new_tags = current_tags << params[:word_tag]

    current_user.tag(word, with: new_tags, on: :vocabularies)

    redirect_to :back
  end

  def destroy
    word = Word.find(params[:id])
    current_tags = word.vocabularies_from(current_user)

    new_tags = current_tags.delete(params[:word_tag]) || []

    current_user.tag(word, with: new_tags, on: :vocabularies)

    redirect_to :back
  end
end
