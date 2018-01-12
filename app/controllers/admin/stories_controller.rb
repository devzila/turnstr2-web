class Admin::StoriesController < Admin::BaseController
before_action :set_story, only: [:show, :update, :destroy]

  def index
    @stories = Story.all
  end

  

  def set_story
    @story = Story.find(params[:id])
  end


end