class MocksController < ApplicationController

  def new
    @mock = Mock.new
  end

  def create
    @mock = Mock.new(mock_params)

    if @mock.save
      picks = []
      @mock.round_count.times do |i|
        @mock.team_count.times do |n|
          picks.push(mock_id: @mock.id, team_id: n, index: n + (i * @mock.team_count))
        end
      end

      Pick.transaction do
        Pick.create(picks)
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
