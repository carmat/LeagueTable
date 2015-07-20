class Season < ActiveRecord::Base
  has_many :leagues, dependent: :destroy
  validates :name, presence: true
end
