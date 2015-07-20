class AddLeagueRefToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :league, index: true, foreign_key: true
  end
end
