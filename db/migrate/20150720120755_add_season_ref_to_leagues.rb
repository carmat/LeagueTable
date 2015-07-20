class AddSeasonRefToLeagues < ActiveRecord::Migration
  def change
    add_reference :leagues, :season, index: true, foreign_key: true
  end
end
