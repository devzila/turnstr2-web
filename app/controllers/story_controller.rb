class StoryController < ApplicationController
  layout false
  def show

    @story = Story.find_by(id: params[:id])

    if @story.blank?
      @story = Story.last
    end

    @face1_url = @story.face1_media.url(:thumb)
    @face2_url = @story.face2_media.file? ? @story.face2_media.url(:thumb) : @face1_url
    @face3_url = @story.face3_media.file? ? @story.face3_media.url(:thumb) : @face1_url
    @face4_url = @story.face4_media.file? ? @story.face4_media.url(:thumb) : @face2_url
    @face5_url = @story.face5_media.file? ? @story.face5_media.url(:thumb) : @face3_url
    @face6_url = @story.face6_media.file? ? @story.face6_media.url(:thumb) : @face4_url

    @user_name = @story.user.username || @story.user.name

  end

end