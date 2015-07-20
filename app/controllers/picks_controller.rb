class PicksController < ApplicationController

  def edit
    @pick = params[:id]
  end

  def update
    @pick = Pick.new(pick_params)
    @pick.index = params[:id]
  end

  private

    def pick_params
      params.require(:pick).permit(:team_id, :player_id)
    end
end
