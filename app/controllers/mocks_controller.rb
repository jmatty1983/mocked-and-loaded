class MocksController < ApplicationController

  def new
    @mock = Mock.new
    12.times { |i| @mock.teams.build(name: "Team #{i + 1}") }
  end

  def create
    @mock = Mock.new(mock_params)
    @mock.teams[@mock.user_team.to_i].user_team = true
    @mock.teams.each_with_index { |team, i| team.index = i }

    if @mock.valid?
      index = 1
      @picks = []

      @mock.round_count.times do |i|
        if i % 2 == 0
          @mock.teams.each do |team|
            @picks << team.picks.build(index: index)
            index = index + 1
          end
        else
          @mock.teams.reverse.each do |team|
            @picks << team.picks.build(index: index)
            index = index + 1
          end
        end
      end

      render 'show'
    else
      render 'new'
    end
  end

  def start

  end

  private

    def mock_params
      params.require(:mock).permit(:name, :player_count, :qb, :rb, :wr, :te,
                                   :rbwr, :rbwrte, :qbrbwrte, :k, :dst, :bn,
                                   :team_count, :user_team,
                                   teams_attributes: [:name])
    end
end