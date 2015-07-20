class ConnectLeaguesPerSeason < ActiveRecord::Migration
  def change
    add_column :leagues, :promo_to, :integer
    add_column :leagues, :promo_from, :integer
    add_column :leagues, :rel_to, :integer
    add_column :leagues, :rel_from, :integer
  end
end
