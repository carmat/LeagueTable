module SeasonsHelper
  def season_has_league?
    @season.leagues.length
  end
end
