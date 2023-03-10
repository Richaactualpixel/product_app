class User < ApplicationRecord

  has_many :products
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  validates :dob, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/ }
  validates :country_id, presence: true

  before_save :normalize_email
  after_create :send_welcome_email

  private

  def normalize_email
    self.email = email.downcase
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
