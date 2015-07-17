class FixturesController < ApplicationController
  def new
  end

  def create
    render plain: params[:fixture].inspect
  end
end
