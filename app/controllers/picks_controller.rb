class PicksController < ApplicationController

  def edit
    @pick = Pick.find(params[:id])
  end
end
