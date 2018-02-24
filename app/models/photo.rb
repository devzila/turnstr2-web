class Photo < ApplicationRecord
	belongs_to :album
	delegate :user, to: :album



	# Paperclip configuration for adding image to User
  has_attached_file :image, styles: { thumb: "300x300>", medium: "1024x1024"}, default_url: "http://#{Rails.application.secrets.host}/images/missing.png"                    


end
