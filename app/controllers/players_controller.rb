class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
    render json: @player
  end

  def search
    searchStr = params[:string]
    players = Player.where("LOWER(full_name) like ?", "%#{searchStr}%".downcase).limit(5)
    retHash = { searchStr: searchStr, players: players }
    render json: retHash
  end
end
