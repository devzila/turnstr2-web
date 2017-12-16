class Member::SessionsController < Member::BaseController
  
  skip_before_filter :authorize

  def new
    return redirect_to('/member/home') if current_member.present?
  end

  def create

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:member_id] = user.id
      redirect_to '/member/home'
    else
      flash[:error] = 'Invalid login password'

      redirect_to new_member_session_path
    end

  end

  def destroy
    session[:member_id] = nil
    redirect_to new_member_session_path
  end

end
