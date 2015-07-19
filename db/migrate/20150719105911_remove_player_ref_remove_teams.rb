class RemovePlayerRefRemoveTeams < ActiveRecord::Migration
  def change
    remove_reference :teams, :player
  end
end
