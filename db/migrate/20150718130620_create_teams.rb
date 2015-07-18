class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team
    end
    add_index :teams, :id
  end
end
