class SynsetsController < ApplicationController
  def show
    @synset = Synset.from_id(params[:id])
    @word = @synset.word_for(current_user) if signed_in?
    @previous_word = Synset.from_id(params[:previous_id])
  end
end
