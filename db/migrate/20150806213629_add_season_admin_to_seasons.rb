class AddSeasonAdminToSeasons < ActiveRecord::Migration
  def change
    add_reference :seasons, :player, index: true, foreign_key: true
    rename_column :seasons, :player_id, :admin
  end
end
