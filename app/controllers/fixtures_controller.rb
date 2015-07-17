class FixturesController < ApplicationController
  def index
  end

  def show
    @fixture = Fixture.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    # render plain: params[:fixture].inspect
    @fixture = Fixture.new(fixture_params)
    @fixture.save
    redirect_to @fixture
  end

  def update
  end

  def destroy
  end

  private
    def fixture_params
      params.require(:fixture).permit(:home_goals, :away_goals)
    end
end
