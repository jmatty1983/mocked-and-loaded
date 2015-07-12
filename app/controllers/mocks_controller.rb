class MocksController < ApplicationController

  def new
    @mock = Mock.new
    12.times { |i| @mock.teams.build(name: "Team #{i + 1}") }
  end

  def create
    @mock = Mock.new(mock_params)
    @mock.teams[@mock.user_team.to_i].user_team = true

    if @mock.save
      teams = @mock.teams

      Pick.transaction do
        @mock.round_count.times do |i|
          if i % 2 == 0
            teams.each do |team|
              team.picks.create()
            end
          else
            teams.reverse.each do |team|
              team.picks.create()
            end
          end
        end
      end

      redirect_to @mock
    else
      render 'new'
    end
  end

  def show
    @mock = Mock.find(params[:id])
  end

  private

    def mock_params
      params.require(:mock).permit(:name, :player_count, :qb, :rb, :wr, :te,
                                   :rbwr, :rbwrte, :qbrbwrte, :k, :dst, :bn,
                                   :team_count, :user_team,
                                   teams_attributes: [:name])
    end
end