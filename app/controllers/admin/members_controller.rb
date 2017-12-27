class Admin::MembersController < Admin::BaseController


  def index
    @members = User.all
  end

end