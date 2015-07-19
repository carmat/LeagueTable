class DestroyTeams < ActiveRecord::Migration
  def change
    drop_table :teams
  end
end
