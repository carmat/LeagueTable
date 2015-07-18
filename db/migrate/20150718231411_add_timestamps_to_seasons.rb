class AddTimestampsToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :created_at, :datetime
    add_column :seasons, :updated_at, :datetime
  end
end
