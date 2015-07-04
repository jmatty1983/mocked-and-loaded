class MocksController < ApplicationController

  def new
    @mock = Mock.new
  end

  def create
    @mock = Mock.new(mock_params)

    if @mock.save
      Team.transaction do
        @mock.team_count.times do |n|
          @mock.teams.create(name: "Team #{n}")
        end
      end

      teams = @mock.teams

      Pick.transaction do
        @mock.round_count.times do |i|
          teams.each do |team|
            team.picks.create()
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
                                   :team_count)
    end
end
