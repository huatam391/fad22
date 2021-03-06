class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  enum role: {normal: 0, admin: 1}
  before_save :downcase_email
  validates :name, presence: true,
    length: {maximum: Settings.users.name.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.users.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.users.password.minimum}
  scope :order_desc, ->{order created_at: :desc}

  def downcase_email
    email.downcase!
  end

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute :remember_digest, nil
  end
end
