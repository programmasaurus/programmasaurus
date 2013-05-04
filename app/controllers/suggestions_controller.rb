class SuggestionsController < ApplicationController
  def create
    WikiDumpWorker.perform_async(params[:id])
    redirect_to :back
  end
end
