class User < ApplicationRecord
  has_secure_password validations: false

  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :devices, class_name: 'UserDevice', dependent: :destroy



  has_one :live_session, -> { where('completed = ?', false).order("created_at DESC") }
  has_many :live_sessions, dependent: :destroy

  has_and_belongs_to_many :favourites,
                          class_name: "User",
                          join_table:  :favourites,
                          foreign_key: :user_id,
                          association_foreign_key: :favourite_user_id,
                          dependent: :destroy

  has_many :active_relationships,  class_name:  "Relationship",
           foreign_key: "follower_id",
           dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower, dependent: :destroy


  def name
    "#{first_name} #{last_name}"
  end
end
