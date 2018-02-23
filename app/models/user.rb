class User < ApplicationRecord
  has_secure_password validations: false
  has_many :stories

  def name
    "#{first_name} #{last_name}"
  end
end
