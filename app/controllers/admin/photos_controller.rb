class Admin::PhotosController < Admin::BaseController
  before_action :set_photo, only: [:show, :update, :destroy]
  before_action :set_page_title

  def index
    @photos = Photo.page(params[:page]).per(10)
  end

  def show

  end


  def destroy
    begin
      if @photo.destroy
        flash[:notice] = 'Photo is successfully deleted.'
      else
        flash[:notice] = 'Error in deleting photo.'
      end
    rescue
      flash[:notice] = 'Error in deleting photo.'
    end
    redirect_to admin_photos_path
  end

  

  def set_video
    @photo = Photo.find(params[:id])
  end

def set_page_title
  @page_title = "Photo Library"
end


end