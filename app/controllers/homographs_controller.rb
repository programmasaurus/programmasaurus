class HomographsController < ApplicationController
  def show
    @homograph = Homograph.lookup(params[:id])

    if @homograph.blank?
      flash[:error] = "Sorry, the word you're looking for is not in the database."
      redirect_to :back
    end
  end
end
