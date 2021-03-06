class VocabulariesController < ApplicationController
  before_filter :require_user!

  def index
    @vocabularies = current_user.vocabularies
  end

  def show
    @vocabulary = current_user.vocabularies.find(params[:id])
  end

  def create
    vocabulary_params = params[:vocabulary].permit(:title)
    vocabulary = current_user.vocabularies.build(vocabulary_params)

    word_params = params[:word].permit(:lemma, :synset_id)
    word = vocabulary.words.build(word_params)

    vocabulary.save!
    word.save!

    redirect_to :back
  end

  def destroy
    @vocabulary = current_user.vocabularies.find(params[:id])
    @vocabulary.destroy!
    redirect_to vocabularies_path
  end

end
