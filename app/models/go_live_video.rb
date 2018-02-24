class GoLiveVideo < ApplicationRecord


  default_scope { order(created_at: :desc) }

  scope :uploaded, -> {where(status: 'uploaded').order("created_at desc")}

  def owner
    LiveSession.find_by(session_id: opentok_session_id)&.user
  end

  def url
    'https://' + Rails.application.secrets.s3_host_name + '/' + Rails.application.secrets.s3_bucket  + '/' + Rails.application.config.open_tok_api_key + '/' + (opentok_id || '') +  '/archive.mp4'
  end

end