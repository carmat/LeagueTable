class Season < ActiveRecord::Base
  # has_many :leagues, dependent: :destroy
  belongs_to :player
  default_scope -> { order(created_at: :desc) }
  validates :admin, presence: true
  validates :name, presence: true
end
