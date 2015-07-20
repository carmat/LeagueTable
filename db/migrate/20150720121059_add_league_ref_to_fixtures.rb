class AddLeagueRefToFixtures < ActiveRecord::Migration
  def change
    add_reference :fixtures, :league, index: true, foreign_key: true
  end
end
