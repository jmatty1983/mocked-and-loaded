class PlayersController < ApplicationController

  def search
    players = Player.where("LOWER(full_name) like ?", "%#{params[:string]}%".downcase).limit(5)
    render json: players
  end
end
