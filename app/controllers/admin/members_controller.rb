class Admin::MembersController < Admin::BaseController
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :set_page_title
  #  @posts = Post.page(params[:page]).per(10)

  def index
    @members = User.page(params[:page]).per(10)
  end

  def edit
    @member = User.find(params[:id])
    respond_to { |format| format.html }
  end

  def update
    @member.update_attributes(member_params)
    flash[:notice] = 'Profile is successfully updated.'
    redirect_to('/admin/members')
  end

  def destroy
    begin
      if @member.destroy
        flash[:notice] = 'Profile is successfully updated.'
      else
        flash[:notice] = 'First delete related stories and videos before deleting user.'
      end
    rescue
      flash[:notice] = 'First delete related stories and videos before deleting user.'
    end
    redirect_to('/admin/members')
  end
  

  def set_member
    @member = User.find(params[:id])
  end

  private

  def member_params
	 params.require(:user).permit(:first_name, :last_name, :gender,  :bio, :address, :city, :state,:website, :info, :phone, :is_verified, :is_active)
  end

  def set_page_title
    @page_title = "Members"
  end

end



