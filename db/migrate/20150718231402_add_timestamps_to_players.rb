class AddTimestampsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :created_at, :datetime
    add_column :players, :updated_at, :datetime
  end
end
