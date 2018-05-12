class Admin::HomeController < Admin::BaseController

  before_action :set_page_title

  def index
    @user_count = User.count
    @comment_count = Comment.count
    @story_count = Story.count
    @photo_count = Photo.count
    @video_count = GoLiveVideo.count

  end


  def set_page_title
    @page_title = "Dashboard"
  end

end