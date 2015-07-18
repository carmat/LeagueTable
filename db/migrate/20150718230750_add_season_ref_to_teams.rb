class AddSeasonRefToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :season, index: true, foreign_key: true
  end
end
