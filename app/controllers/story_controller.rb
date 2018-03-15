class StoryController < ApplicationController
  layout false
  def show

    @story = Story.find_by(id: params[:id])

    if @story.blank?
      @story = Story.last
    end

    @face1_url = @story.face1_media.url(:thumb)
    @face2_url = @story.face2_media.file? ? object.face2_media.url(:thumb) : @face1_url
    @face3_url = @story.face3_media.file? ? object.face3_media.url(:thumb) : @face1_url
    @face4_url = @story.face4_media.file? ? object.face4_media.url(:thumb) : @face2_url
    @face5_url = @story.face5_media.file? ? object.face5_media.url(:thumb) : @face3_url
    @face6_url = @story.face6_media.file? ? object.face6_media.url(:thumb) : @face4_url

  end

end