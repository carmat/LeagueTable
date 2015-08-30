class FixturesController < ApplicationController
  # def index
  #   @fixtures = Fixture.all
  # end

  # def show
  #   @fixture = Fixture.find(params[:id])
  # end

  # def new
  #   @fixture = Fixture.new
  # end

  # def edit
  #   @fixture = Fixture.find(params[:id])
  # end

  # def create
  #   # render plain: params[:fixture].inspect
  #   @fixture = Fixture.new(fixture_params)

  #   if @fixture.save
  #     redirect_to @fixture
  #   else
  #     render "new"
  #   end
  # end

  # def update
  #   @fixture = Fixture.find(params[:id])

  #   if @fixture.update(fixture_params)
  #     redirect_to @fixture
  #   else
  #     render "edit"
  #   end
  # end

  # def destroy
  #   @fixture = Fixture.find(params[:id])
  #   @fixture.destroy

  #   redirect_to fixtures_path
  # end

  # private
  #   def fixture_params
  #     params.require(:fixture).permit(:home_goals, :away_goals)
  #   end
end
