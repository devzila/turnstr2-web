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


    @face1_ori_url = @story.face1_media.url
    @face2_ori_url = @story.face2_media.url || @face1_ori_url
    @face3_ori_url = @story.face3_media.url || @face1_ori_url
    @face4_ori_url = @story.face4_media.url || @face2_ori_url
    @face5_ori_url = @story.face5_media.url || @face3_ori_url
    @face6_ori_url = @story.face6_media.url || @face5_ori_url

    @user_name = @story.user.username || @story.user.name

  end

end