class HomographsController < ApplicationController
  def show
    @homograph = Homograph.lookup(params[:query])

    if params[:query].blank?
      flash[:error] = "You'll need to type a word into the search box."
      redirect_to :back
    elsif @homograph.no_data?
      flash[:error] = "Sorry... We're drawing a blank on #{params[:query]}. Perhaps you can search with a similar word?"
      redirect_to :back
    elsif @homograph.synsets.count == 1
      redirect_to synset_path(@homograph.synsets.first.id, origin_lemma: params[:query])
    end
  end
end
