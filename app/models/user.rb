class User < ApplicationRecord
  has_secure_password
  before_create :confirmation_token
  
  validates :email, presence: true, uniqueness: true

  def json_data
    self.as_json(only: [:email])
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
  end

  private

  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
end
