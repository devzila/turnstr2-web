class StoryController < ApplicationController
  layout false
  def show

    @story = Story.find_by(id: params[:id])



    if @story.blank?
      @story = Story.last
    end


    @face1_url = @story.get_face_thumb_image(1)
    @face2_url = @story.get_face_thumb_image(2) || @face1_url
    @face3_url = @story.get_face_thumb_image(3) || @face1_url
    @face4_url = @story.get_face_thumb_image(4) || @face2_url
    @face5_url = @story.get_face_thumb_image(5) || @face3_url
    @face6_url = @story.get_face_thumb_image(6) || @face4_url

    @user_name = @story.user.username || @story.user.name

  end

end