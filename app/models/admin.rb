class Admin < ApplicationRecord
  has_secure_password validations: false
end