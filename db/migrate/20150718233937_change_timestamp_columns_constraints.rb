class ChangeTimestampColumnsConstraints < ActiveRecord::Migration
  def change
    change_column :leagues, :created_at, :datetime, null: false
    change_column :leagues, :updated_at, :datetime, null: false

    change_column :players, :created_at, :datetime, null: false
    change_column :players, :updated_at, :datetime, null: false

    change_column :teams, :created_at, :datetime, null: false
    change_column :teams, :updated_at, :datetime, null: false

    change_column :seasons, :created_at, :datetime, null: false
    change_column :seasons, :updated_at, :datetime, null: false
  end
end
