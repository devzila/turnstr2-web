class Admin::StoriesController < Admin::BaseController
  before_action :set_story, only: [:show, :update, :destroy]
  before_action :set_page_title

  def index
    @stories = Story.all
  end

  

  def set_story
    @story = Story.find(params[:id])
  end

def set_page_title
  @page_title = "Turn Stroies"
end


end