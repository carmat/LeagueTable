class ChangeFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :home_team
      t.integer :home_goals
      t.integer :away_team
      t.integer :away_goals

      t.timestamps null: false
    end
  end
end
