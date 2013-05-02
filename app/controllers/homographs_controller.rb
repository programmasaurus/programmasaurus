class HomographsController < ApplicationController
  def show
    @homograph = Homograph.lookup(params[:id])
  end
end
