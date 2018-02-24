class Admin::StoriesController < Admin::BaseController
  before_action :set_story, only: [:show, :update, :destroy]
  before_action :set_page_title

  def index
    @stories = Story.page(params[:page]).per(10)
  end

  def show

  end


  def destroy
    begin
      if @story.destroy
        flash[:notice] = 'Story is successfully deleted.'
      else
        flash[:notice] = 'Error in deleting story.'
      end
    rescue
      flash[:notice] = 'Error in deleting story.'
    end
    redirect_to admin_stories_path
  end

  

  def set_story
    @story = Story.find(params[:id])
  end

def set_page_title
  @page_title = "Turn Stroies"
end


end