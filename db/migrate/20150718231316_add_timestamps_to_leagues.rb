class AddTimestampsToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :created_at, :datetime
    add_column :leagues, :updated_at, :datetime
  end
end
