class Admin::MembersController < Admin::BaseController


  def index
    @members = User.all
  end

  #def edit
 #   @member = User.find(params[:id])
 # end


  def update
  @member = User.find(params[:id])
  @member.update(first_name: params[:first_name], last_name: params[:last_name])
  redirect_to('/admin/home')
end


  private

  def member_params
	params.require().permit :info, :phone, :first_name, :last_name, :gender, :website, :bio, :address, :city, :state, :isverified, :isactive
  end

end