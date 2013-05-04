class SynsetsController < ApplicationController
  before_filter :require_user!

  def show
    @synset = Synset.from_id(params[:id])
    @previous_word = Synset.from_id(params[:previous_id])
  end
end
