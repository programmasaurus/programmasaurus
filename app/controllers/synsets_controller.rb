class SynsetsController < ApplicationController
  def show
    @synset = Synset.from_id(params[:id])
  end
end
