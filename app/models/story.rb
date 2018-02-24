class Story < ApplicationRecord

  belongs_to :user

  # Paperclip configuration for adding image to User
  has_attached_file :face1_video_thumb, styles: { thumb: "300x300>"}
  has_attached_file :face2_video_thumb, styles: { thumb: "300x300>"}
  has_attached_file :face3_video_thumb, styles: { thumb: "300x300>"}
  has_attached_file :face4_video_thumb, styles: { thumb: "300x300>"}
  has_attached_file :face5_video_thumb, styles: { thumb: "300x300>"}
  has_attached_file :face6_video_thumb, styles: { thumb: "300x300>"}

  has_attached_file :face1_media, styles: { thumb: "300x300>"}
  has_attached_file :face2_media, styles: { thumb: "300x300>"}
  has_attached_file :face3_media, styles: { thumb: "300x300>"}
  has_attached_file :face4_media, styles: { thumb: "300x300>"}
  has_attached_file :face5_media, styles: { thumb: "300x300>"}
  has_attached_file :face6_media, styles: { thumb: "300x300>"}


  scope :list, -> {
    eager_load(:user)
  }

end