class Fixture < ActiveRecord::Base
  validates :home_goals, presence: true, length: {minimum: 1}
  validates :away_goals, presence: true, length: {minimum: 1}
end
