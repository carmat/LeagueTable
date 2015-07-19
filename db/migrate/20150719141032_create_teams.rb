class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name

      t.timestamps null: false
    end

    add_reference :teams, :player, index: true, foreign_key: true
  end
end
