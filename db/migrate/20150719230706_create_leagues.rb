class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :rel_places
      t.integer :rel_playoff_places
      t.integer :promo_places
      t.integer :promo_playoff_places
      t.integer :previous_league

      t.timestamps null: false
    end
  end
end
