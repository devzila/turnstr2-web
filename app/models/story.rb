class Story < ApplicationRecord

  belongs_to :user

  scope :list, -> {
    eager_load(:user)
  }

end