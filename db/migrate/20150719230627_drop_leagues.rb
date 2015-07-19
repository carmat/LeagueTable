class DropLeagues < ActiveRecord::Migration
  def change
    drop_table :leagues
  end
end
