class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true

  def json_data
    self.as_json(only: [:email])
  end
end
