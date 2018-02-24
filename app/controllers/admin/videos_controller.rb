class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: [:show, :update, :destroy]
  before_action :set_page_title

  def index
    @videos = GoLiveVideo.uploaded.page(params[:page]).per(10)
  end

  def show

  end


  def destroy
    begin
      if @video.destroy
        flash[:notice] = 'Video is successfully deleted.'
      else
        flash[:notice] = 'Error in deleting video.'
      end
    rescue
      flash[:notice] = 'Error in deleting video.'
    end
    redirect_to admin_videos_path
  end

  

  def set_video
    @video = GoLiveVideo.find(params[:id])
  end

def set_page_title
  @page_title = "Go Live Videos"
end


end