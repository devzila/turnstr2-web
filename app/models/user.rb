class User < ApplicationRecord
  has_secure_password validations: false


  def name
    "#{first_name} #{last_name}"
  end
end
