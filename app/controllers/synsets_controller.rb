class SynsetsController < ApplicationController
  before_filter :require_user!

  def show
    @synset = Synset.from_id(params[:id])
    @homograph = Homograph.lookup(params[:origin_lemma]) if params[:origin_lemma].present?
  end
end
