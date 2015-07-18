class AddTeamsToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :home_team, :string
    add_column :fixtures, :away_team, :string

    add_index :fixtures, :id
  end
end
