class SuggestionsController < ApplicationController
  def create
    suggestion_attempt = SuggestionAttempt.where(synset_id: params[:id]).first_or_initialize
    unless suggestion_attempt.persisted?
      suggestion_attempt.save!
      WikiDumpWorker.perform_async(params[:id])
      redirect_to :back
    end
  end
end
