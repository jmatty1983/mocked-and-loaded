class PicksController < ApplicationController

  def edit
    @pick = Pick.find(params[:id])
  end

  def update
    @pick = Pick.find(params[:id])
    @pick.update(pick_params)
  end

  private

    def pick_params
      params.require(:pick).permit(:team_id, :player_id)
    end
end
