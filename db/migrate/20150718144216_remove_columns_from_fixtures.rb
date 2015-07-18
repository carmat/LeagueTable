class RemoveColumnsFromFixtures < ActiveRecord::Migration
  def change
    remove_column :fixtures, :home_team
    remove_column :fixtures, :away_team
  end
end
