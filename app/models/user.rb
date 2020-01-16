class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :downcase_email
  before_validation :strip_whitespace

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  # enforces validations on the virtual `password` and `password_confirmation` attributes
  has_secure_password

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
    def downcase_email
      self.email.downcase!
    end

    def strip_whitespace # put this in a concern to be available to all models
      [first_name, last_name, email].each { |attr| attr.strip! unless attr.nil? }
    end

end
