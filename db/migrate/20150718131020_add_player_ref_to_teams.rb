class AddPlayerRefToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :player, index: true, foreign_key: true

    create_join_table :players, :teams do |t|
      t.index [:player_id, :team_id]
    end
  end
end
