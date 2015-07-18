class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :releg_places
      t.integer :releg_playoff_places
      t.integer :promo_places
      t.integer :promo_playoff_places
    end
  end
end
