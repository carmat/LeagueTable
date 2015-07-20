class Fixture < ActiveRecord::Base
  belongs_to :league

  validates :home_goals, presence: true, length: {minimum: 1}
  validates :away_goals, presence: true, length: {minimum: 1}
end
