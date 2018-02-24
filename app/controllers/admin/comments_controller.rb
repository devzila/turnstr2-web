class Admin::CommentsController < Admin::BaseController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_page_title

  def index
    @comments = Comment.page(params[:page]).per(10)
  end

  def show

  end


  def destroy
    begin
      if @comment.destroy
        flash[:notice] = 'Comment is successfully deleted.'
      else
        flash[:notice] = 'Error in deleting comment.'
      end
    rescue
      flash[:notice] = 'Error in deleting comment.'
    end
    redirect_to admin_comments_path
  end

  

  def set_comment
    @comment = Comment.find(params[:id])
  end

def set_page_title
  @page_title = "Comments"
end


end