class RemovePlayerRefFromTeams < ActiveRecord::Migration
  def change
    remove_reference :teams, :player

    drop_table :players
  end
end
