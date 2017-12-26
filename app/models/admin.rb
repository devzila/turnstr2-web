class Admin < ApplicationRecord
  has_secure_password validations: false


  def name
    [first_name, last_name].join(' ')
  end
end