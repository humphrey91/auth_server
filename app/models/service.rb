class Service < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, uniqueness: true
end
