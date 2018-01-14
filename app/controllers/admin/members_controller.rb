class Admin::MembersController < Admin::BaseController
before_action :set_member, only: [:show, :update, :destroy]
  #  @posts = Post.page(params[:page]).per(10)

  def index
    @members = User.page(params[:page]).per(10)
  end

  def edit
    @member = User.find(params[:id])
    respond_to { |format| format.html }
  end

  def update
    @member = User.find(params[:id])
    @member.update_attributes(member_params)
    flash[:notice] = 'Profile is successfully updated.'
    redirect_to('/admin/members')
  end
  

  def set_member
    @member = User.find(params[:id])
  end

  private

  def member_params
	 params.require(:user).permit(:first_name, :last_name, :gender,  :bio, :address, :city, :state,:website, :info, :phone, :is_verified, :is_active)
  end

end



