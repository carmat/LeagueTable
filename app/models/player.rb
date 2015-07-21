class Player < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
            presence: true
  validates :email,
            presence: true,
            length: { maximum: 225 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  attr_accessor :name, :email, :team

  def initialise(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
    @team = attributes[:team]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
