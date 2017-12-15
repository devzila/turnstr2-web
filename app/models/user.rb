class User < ApplicationRecord
  self.inheritance_column = 'type'
  has_secure_password validations: false
end
